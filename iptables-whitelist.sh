#!/bin/bash

rm -rf ip-ranges.json;
wget https://ip-ranges.amazonaws.com/ip-ranges.json;

python aws-ip-range.py

chkconfig iptables on
service iptables restart;
iptables -F;

while read i; do
$i
echo $i
done < /home/ec2-user/bin/whitelist.txt
