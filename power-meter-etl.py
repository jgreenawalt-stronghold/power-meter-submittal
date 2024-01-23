import json
import urllib3
import requests

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

start_time = "2023-11-27T00:00:00Z"
end_time = "2023-11-27T00:59:59Z"
interval = "1h"


pi_headers = {"Content-type": "application/json", "X-Requested-With": "XmlHttpRequest"}
pi_url_prefix = "https://sg-piintegrator.scrubgrass.com/piwebapi/streams/"
pi_url_body = f"/summary/?summaryType=Average&startTime={start_time}&endTime={end_time}&interval={interval}"

def get_hourly_value(path, session):
    try:
        response = session.get(path, headers=pi_headers, verify=False)
        if response.status_code == 200:
            r = response.json()
            print(round(r["Items"][0]["Value"]["Value"], 3))
    except Exception as e:
        print(f'Error: {e}')


def get_web_id(tag, data):
    for point in data["points"]:
        if point["tag"] == tag:
            return point["webid"]
    return None

tag_search = "MAJT402"
web_id =  get_web_id(tag_search, pidata)
path = pi_url_prefix + web_id + pi_url_body

session = requests.Session()
session.auth = (pi_user, pi_password)

get_hourly_value(path, session)

# Format the data into XML
#timestamp = dt.datetime.now()
#timestamp.strftime("%Y-%m-%dT%H:%M:%S")

# Upload the data using PJM Power Meter CLI -> Java executable

# Send notification e-mail to respective parties


