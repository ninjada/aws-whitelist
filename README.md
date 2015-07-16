# aws-whitelist
Script to obtain latest AWS IP-Ranges which is in .json form and sort into IPtables commands to whitelist AWS ranges:

https://aws.amazon.com/blogs/aws/aws-ip-ranges-json/
https://ip-ranges.amazonaws.com/ip-ranges.json

The aws-ip-range.py script obtains the latest amazon ip-ranges.json, loops through all included ranges and outputs the IP/CIDR in format of iptables command to whitelist the range. 

In my case, I use this to whitelist a port 8080 to receive SNS notifications but block anything else.

***NOTE***: For my requirements, an extra if statement filters only specific range(s) eg. ap-southeast-2. Remove or alter for your needs.

The iptables-whitelist.sh script runs the python script, flushes iptables and then runs the list of iptables commands to whitelist. I run this daily for my needs.

***TO DO***: it would be neat to have python check the ip-ranges.json date and only pull down if it is newer. Also would be nice to have entire thing done in one script.
