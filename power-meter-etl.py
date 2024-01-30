import urllib3
import requests
from datetime import date, timedelta

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

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

pi_user = "piwebapi_write"
pi_password = "nNRf7USFQ6ca&1"

session = requests.Session()
session.auth = (pi_user, pi_password)

interval = "1m"
today = date.today()
yesterday = today - timedelta(days=1)

pi_headers = {"Content-type": "application/json", "X-Requested-With": "XmlHttpRequest"}
pi_url_prefix = "https://10.20.145.224/piwebapi/streams/"

def get_hourly_value(path, session):
    try:
        response = session.get(path, headers=pi_headers, verify=False)
        if response.status_code == 200:
            r = response.json()
            data = format(round(r["Items"][0]["Value"]["Value"], 3), ".3f")
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
    print(data)
    return data
    
# Format the data into XML

def write_xml_header():
    with open('submission.xml', 'a') as xml:
        xml.write('<ns2:MeterValues>\n')

def write_xml_footer():
    with open('submission.xml', 'a') as xml:
        xml.write('<totalLoss/>\n')
        xml.write('<totalInadvertent/>\n')
        xml.write('</ns2:MeterValues>\n')

def write_xml(meter_info, meter_list, daily_values):
    with open('submission.xml', 'a') as xml:
        xml.write('<meterAccount>\n')
        for info, entry in zip(meter_info, meter_list):
            xml.write(f'<{info}>{entry}</{info}>\n')
        xml.write('<hourlyMeterValues>\n')
        for i , value in zip(range(23), daily_values):
            start_time = f"{yesterday.strftime('%Y-%m-%d')}T{str(i).zfill(2)}:00:00.000-05:00"
            end_time = f"{yesterday.strftime('%Y-%m-%d')}T{str(i+1).zfill(2)}:00:00.000-05:00"
            xml.write(f'<intervalValue>\n')
            xml.write(f'<startDate>{start_time}</startDate>\n')
            xml.write(f'<endDate>{end_time}</endDate>\n')
            xml.write(f'<mw>{value}</mw>\n')
            xml.write(f'</intervalValue>\n')
        start_time = f"{yesterday.strftime('%Y-%m-%d')}T23:00:00.000-05:00"
        end_time = f"{today.strftime('%Y-%m-%d')}T00:00:00.000-5:00"
        xml.write('<intervalValue>\n')
        xml.write(f'<startDate>{start_time}</startDate>\n')
        xml.write(f'<endDate>{end_time}</endDate>\n')
        xml.write(f'<mw>{daily_values[23]}</mw>\n')
        xml.write('</intervalValue>\n')
        xml.write('</hourlyMeterValues>\n')
        xml.write('</meterAccount>\n')


meter_info = ['meterAccountID', 'meterAccountName', 'meterType', 'ehv', 'counterParty']
sg_3351 = ['3351', 'Scrubgrass', 'GEN', 'NO', 'PaElec']
sg_poi = ['10567', 'Scrubgrass POI Info-Meter', 'GEN', 'NO', 'PaElec']
sg_ss = ['10568', 'Scrubgrass SS Info-Meter', 'GEN', 'NO', 'PaElec']

def main():
    write_xml_header()
    write_xml(meter_info, sg_3351, get_daily_values(get_web_id("MAPCScrubgrass3351", pidata)))
    write_xml(meter_info, sg_poi, get_daily_values(get_web_id("MAJT402", pidata)))
    write_xml(meter_info, sg_ss, get_daily_values(get_web_id("PARASITE", pidata)))
    write_xml_footer()

main()


# Upload the data using PJM Power Meter CLI -> Java executable

# Send notification e-mail to respective parties


