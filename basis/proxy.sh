#!/bin/bash
# a script to manage your proxy more easily.
goa_path=
sudo apt-get install libnss3-tools
sudo mkdir /usr/local/ca-certificates/
certutil -d sql:$HOME/.pki/nssdb -A -t "C,," -n GoAgent -i $goa_path'/local/ca.crt'
if ["$1" -eq "on"]; then
sudo service goagent start && export http_proxy="http://127.0.0.1:8087"
else if [ "$1" -eq "off" ]; then
sudo service goagent stop && unset http_proxy
else
echo "Uage: sudo proxy.sh on|off"
echo "with alias 'goup|goff' to shortcut it."
if
