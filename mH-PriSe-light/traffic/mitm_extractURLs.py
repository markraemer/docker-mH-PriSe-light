"""
this script is read by mimtproxy and will write information about the recorded requests into the database
"""
import json
import os
import requests
import sys

path = os.path.dirname(os.path.realpath(__file__))
os.chdir(path + "/../")
sys.path.insert(0,path + "/../")

from db.URL import URL
from db.Location import Location
import ConfigParser
import argparse
# initialize configuration parser
config = ConfigParser.RawConfigParser()
config.read('../config/config.prop')


# deriving the location of the IP address host
def getIpLocation(ip):
    loc = Location()
    loc.ip_address = ip
    # jsondata = requests.get(config.get("traffic","traffic.ipdatabase.url") + ip).json()
    jsondata = requests.get("http://ipinfo.io/" + ip).json()
    loc.city = jsondata['city']
    loc.country_code = jsondata['country']
    loc.lat = jsondata['loc'].split(',')[0]
    loc.long = jsondata['loc'].split(',')[1]
    if 'region' in jsondata:
        loc.state = jsondata['region']
    if 'postal' in jsondata:
        loc.zip_code = jsondata['postal']
    loc.upsert()
    return jsondata['org']

class extractURLs:
    def __init__(self, package, test_case, time, payload_map):
        return None

    # extracting information from requests: host, url, time and other data
    def request(ctx, flow):
        url = URL()
        url.organization = getIpLocation(flow.request.host)
        url.package=package
        url.analysis="d"
        url.host=flow.request.host # ip address
        url.url=flow.request.url
        url.test_case = test_case
        url.time = time
        if 'host' in flow.request.headers:
            url.hostname = flow.request.headers['host'] # host name
        url.upsert()
        if url.host not in payload_map.keys():
            payload_map[url.host]=[]
        payload_map[url.host].append(len(flow.request.content))

    # extracting the payload size
    #TODO: can be further enhanced to provide more data for map generation
    def response(ctx, flow):
        #if flow.response.host not in payload_map.keys():
        #    payload_map[flow.repsonse.host]=[]
        #payload_map[flow.repsonse.host].append(len(flow.response.body))
        return None


def start():
    global package, test_case, time, payload_map
    parser = argparse.ArgumentParser()
    parser.add_argument("package", type=str)
    parser.add_argument("test_case", type=str)
    parser.add_argument("time", type=str)
    args = parser.parse_args()
    package = args.package
    test_case = args.test_case
    time = args.time
    payload_map = {}
    return extractURLs(package, test_case, time, payload_map)

# closing the file
def done(ctx):
    f = open('workfile.out', 'w')
    for host in payload_map.keys():
        sum = 0
        for msg_len in payload_map[host]:
            sum = sum + msg_len
        f.write("{} {}\n".format(host,sum))
    f.close()