#!/bin/bash

# Simple script to run python json sort script and whitelist ip ranges in iptables

# remove old file and download latest
rm -rf ip-ranges.json;
wget https://ip-ranges.amazonaws.com/ip-ranges.json;

# run python script to sort ranges from json to iptables commands
python aws-ip-range.py

# make sure iptables is on and flush rules before adding latest aws rules
# obvs, this would need to be altered depending on req / pre-existing or other rules etc.
chkconfig iptables on
service iptables restart;
iptables -F;

while read i; do
$i
echo $i
done < /home/ec2-user/bin/whitelist.txt
