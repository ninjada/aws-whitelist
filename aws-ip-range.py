#!/usr/bin/python
import json

fp = open("ip-ranges.json", "r")

ranges = fp.readlines()

fp1 = open("whitelist.txt", "w")

for line in ranges:

    if "{" in line:
        obj = {}
    elif "}" in line:
      # filter everything except specific region: ap-southeast-2
      if obj["region"] == "ap-southeast-2":
        # create iptables rule command
        iprule = "iptables -I INPUT -s " + obj["ip_prefix"] + " -p " + "tcp" + " --dport " + "8080" + " -j ACCEPT\n"
        fp1.write(iprule)
      else:
        continue
    elif "[" in line or "]" in line:
        continue
    else:
        obj[line.split(":")[0].strip().strip('"')] = line.split(":")[1].strip().strip(",").strip('"')

fp1.close()
fp.close()
