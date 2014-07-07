#!/bin/bash

# Set up a fileshare service.
# Samba has a complex config file that easy to mistake, so we use AFP to replace.
# All work is add your sharing path to the list file below after install
# defult share list in  /etc/netatak/AppleVolumes.default

# netatalk implements AppleTalk protocal for fileshare/network-print/appletackRouter
sudo apt-get install netatalk

# Avahi is a sevice discover daemon program.
sudo apt-get install avahi-daemon
sudo cp packages/afp.config /etc/avahi/services/afpd.service

## run script ##
alias afpshare=`sudo echo "$1 $2" > /etc/netatak/AppleVolumes.default`
alias afpon=`sudo service netatalk restart && sudo service avahi-daemon restart`
alias afpoff=`sudo service netatalk stop && sudo service avahi-daemon stop`
## use below to set auto start when os start. ##
# sudo update-rc.d -f avahi-daemon defaults