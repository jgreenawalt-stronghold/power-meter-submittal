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


interval = "1m"
today = date.today()
yesterday = today - timedelta(days=1)
yesterday.strftime("%Y-%m-%d")


pi_headers = {"Content-type": "application/json", "X-Requested-With": "XmlHttpRequest"}
pi_url_prefix = "https://sg-piintegrator.scrubgrass.com/piwebapi/streams/"


def get_hourly_value(path, session):
    try:
        response = session.get(path, headers=pi_headers, verify=False)
        if response.status_code == 200:
            r = response.json()
            print(format(round(r["Items"][0]["Value"]["Value"], 3), ".3f"))
    except Exception as e:
        print(f'Error: {e}')


def get_web_id(tag, data):
    for point in data["points"]:
        if point["tag"] == tag:
            return point["webid"]
    return None

tag_search = "PARASITE"
web_id =  get_web_id(tag_search, pidata)


session = requests.Session()
session.auth = (pi_user, pi_password)

def get_daily_values(web_id):
    for i in range(23):
        start_time = f"{yesterday}T{str(i).zfill(2)}:00:00Z"
        end_time = f"{yesterday}T{str(i+1).zfill(2)}:00:00Z"
        pi_url_body = f"/summary/?summaryType=Average&startTime={start_time}&endTime={end_time}&interval={interval}" 
        path = pi_url_prefix + web_id + pi_url_body
        print(path)
        print(start_time, end_time)
        get_hourly_value(path, session)


get_daily_values(get_web_id("MAJT402", pidata))
# Format the data into XML


# Upload the data using PJM Power Meter CLI -> Java executable

# Send notification e-mail to respective parties


