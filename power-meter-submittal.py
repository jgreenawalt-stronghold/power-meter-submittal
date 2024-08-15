import os
from dotenv import load_dotenv
import urllib3
import requests
import winrm
from datetime import date, timedelta

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
load_dotenv()
# Query the PIWebAPI and gather the hourly data for Tag values

pidata = {
    "points": [
        {
            "tag": "MAPCScrubgrass3351",
            "webid": "F1DP2D-mFxStdkup8XJDcSGY4AIAwAAAU0NSUElQMDFcTUFQQ1NDUlVCR1JBU1MzMzUx"
        },
        {
            "tag": "MAJT402",
            "webid": "F1DP2D-mFxStdkup8XJDcSGY4A7QEAAAU0NSUElQMDFcTUFKVDQwMg"
        },
        {
            "tag": "PARASITE",
            "webid": "F1DP2D-mFxStdkup8XJDcSGY4A0wIAAAU0NSUElQMDFcUEFSQVNJVEU"
        }
    ]
}

pi_user = os.getenv('PI_USER')
pi_password = os.getenv('PI_PASSWORD')

session = requests.Session()
session.auth = (pi_user, pi_password)

interval = "1m"
today = date.today()
yesterday = today - timedelta(days=1)

pi_headers = {"Content-type": "application/json", "X-Requested-With": "XmlHttpRequest"}
pi_url_prefix = os.getenv('PIWEBAPI_PREFIX')

def get_hourly_value(path, session):
    try:
        response = session.get(path, headers=pi_headers, verify=False)
        if response.status_code == 200:
            r = response.json()
            data = (round(r["Items"][0]["Value"]["Value"], 3))
            if data == 0.0:
                return 0
            return data
    except Exception as e:
        print(f'Error: {e}')


def get_web_id(tag, data):
    for point in data["points"]:
        if point["tag"] == tag:
            return point["webid"]
    return None


def get_daily_values(web_id):
    data = []
    for i in range(23):
        start_time = f"{yesterday.strftime('%m/%d/%Y')} {str(i).zfill(2)}:00:00"
        end_time = f"{yesterday.strftime('%m/%d/%Y')} {str(i+1).zfill(2)}:00:00"
        pi_url_body = f"/summary/?summaryType=Average&startTime={start_time}&endTime={end_time}&interval={interval}"
        path = pi_url_prefix + web_id + pi_url_body
        data.append(get_hourly_value(path, session))
    start_time = f"{yesterday.strftime('%m/%d/%Y')} 23:00:00"
    end_time = f"{today.strftime('%m/%d/%Y')} 00:00:00"
    pi_url_body = f"/summary/?summaryType=Average&startTime={start_time}&endTime={end_time}&interval={interval}"
    path = pi_url_prefix + web_id + pi_url_body 
    data.append(get_hourly_value(path, session))
    return data

def restart_pi_analysis_service():
    user = os.getenv('WINRM_USERNAME')
    password = os.getenv('WINRM_PASSWORD')
    if not user or not password:
        raise ValueError("WINRM_USERNAME or WINRM_PASSWORD environment variables are not set.")
    session = winrm.Session(f'http://{PI_SERVER}:{PORT}/wsman', auth=(user, password), transport='ntlm') 
    service = "PIAnalysisManager"
    command = f""" 
    Stop-Service -Name {service} -Force
    Start-Service -Name {service}
    """
    session.run_ps(command)
    
# Format the data into XML
def clear_data():
    with open('submission.xml', 'w') as xml:
        xml.truncate(0)

def write_xml_header():
    with open('submission.xml', 'a') as xml:
        xml.write('<?xml version="1.0" encoding="UTF-8"?>\n')
        xml.write('<pm:SubmittedMeterValues xsi:schemaLocation="http://www.pjm.com/soa/schemas/external/pm/v1 powermeter.xsd" xmlns:pm="http://www.pjm.com/soa/schemas/external/pm/v1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">\n')

def write_xml_footer():
    with open('submission.xml', 'a') as xml:
        xml.write('</pm:SubmittedMeterValues>\n')

def write_xml(meter_info, meter_list, daily_values):
    with open('submission.xml', 'a') as xml:
        xml.write('<meterAccount>\n')
        for info, entry in zip(meter_info, meter_list):
            xml.write(f'<{info}>{entry}</{info}>\n')
        xml.write('<meterValues>\n')
        for i , value in zip(range(23), daily_values):
            start_time = f"{yesterday.strftime('%Y-%m-%d')}T{str(i).zfill(2)}:00:00-04:00"
            end_time = f"{yesterday.strftime('%Y-%m-%d')}T{str(i+1).zfill(2)}:00:00-04:00"
            xml.write(f'<intervalValue>\n')
            xml.write(f'<startDate>{start_time}</startDate>\n')
            xml.write(f'<endDate>{end_time}</endDate>\n')
            xml.write(f'<mw>{value}</mw>\n')
            xml.write(f'</intervalValue>\n')
        start_time = f"{yesterday.strftime('%Y-%m-%d')}T23:00:00-04:00"
        end_time = f"{today.strftime('%Y-%m-%d')}T00:00:00-04:00"
        xml.write('<intervalValue>\n')
        xml.write(f'<startDate>{start_time}</startDate>\n')
        xml.write(f'<endDate>{end_time}</endDate>\n')
        xml.write(f'<mw>{daily_values[23]}</mw>\n')
        xml.write('</intervalValue>\n')
        xml.write('</meterValues>\n')
        xml.write('</meterAccount>\n')


meter_info = ['meterAccountID']
sg_3351 = ['3351']
sg_poi = ['10567']
sg_ss = ['10568']

def main():
    sg_3351_hrl = get_daily_values(get_web_id("MAPCScrubgrass3351", pidata))
    check_for_none = None in sg_3351 ## Checks for None type values in list of hourly values returned from PI database.
    net_hrl = get_daily_values(get_web_id("MAJT402", pidata))
    clear_data()
    write_xml_header()
    if check_for_none: ## Check is True
        sg_3351_hrl_calc = [max(0, x) for x in net_hrl] ## Copies net_hrl list and replaces any value < 0 with 0.
        write_xml(meter_info, sg_3351, sg_3351_hrl_calc)  ## Writes calculated values if None is returned from PI(meaning Analysis Service has failed)  
        restart_pi_analysis_service()
    else: 
            write_xml(meter_info, sg_3351, sg_3351_hrl) ## Uses PI Analysis Service generated values for 3351 meter.
    write_xml(meter_info, sg_poi, net_hrl)
    write_xml(meter_info, sg_ss, get_daily_values(get_web_id("PARASITE", pidata)))
    write_xml_footer()

main()


# Upload the data using PJM Power Meter CLI -> Java executable

# Send notification e-mail to respective parties


