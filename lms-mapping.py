#!/usr/bin/python3

#
# External Rewriting Program:
# https://httpd.apache.org/docs/current/rewrite/rewritemap.html#prg
#
# Apache mod-rewrite will use this program to get unique url for a specific lms
# its currently use json as data source. the program should be run once with httpd
# and will talk to apache via STDIN/STDOUT

import time
import sys
import json

# function to get the mapping
def get_mapping(sps):
  time.sleep(2)
  with open('lms-mapping.json') as json_file:
    data = json.load(json_file)
    if sps in data['urls']:
      return data['urls'][sps]
    return 'NULL'

# start service
while True:
  # get sps from STDIN
  sps = input()

  # print url to STDOUT
  print(get_mapping(sps))



