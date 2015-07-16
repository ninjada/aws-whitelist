# aws-whitelist
Two part script to obtain latest AWS IP-Ranges which is in .json form:

https://aws.amazon.com/blogs/aws/aws-ip-ranges-json/
https://ip-ranges.amazonaws.com/ip-ranges.json

aws-ip-range.py obtains ip-ranges.json, outputs all included ranges in IP/CIDR format as part of iptables command to whitelist the range.

NOTE: have added if statement to filter only specific ranges, eg. ap-southeast-2. Remove or alter for your needs.

iptables-whitelist.sh runs the python script, flushes iptables and then runs the list of iptables commands to whitelist.

TO DO: it would be neat to have python check the ip-ranges.json date and only pull down if it is newer. Also would be nice to have entire thing done in one script.
