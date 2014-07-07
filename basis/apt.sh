#!/bin/bash
# This script shortcut the apt command and deals proxy auto.

if [ -n "$http_proxy" ]; then
apt_proxy=""
else
apt_proxy=" -o Acquire::http::proxy=\"$http_proxy\" "
fi

# Usage
#  apt search
#  apt show
#  apt install
#  apt remove -f|-a|-p
#  apt purge
#  apt update
#  apt upgrade
#  apt depends
#  apt refer
#  apt clean
#  apt check
#  apt source
apt_commands=(search show install remove purge update upgrade depends refer clean check source)

case $1 in
     show | search | depends)
     sudo apt-cache $1 $2
     refer)
     sudo apt-cache rdepends $2

     clean | check)
     sudo apt-get $1
     update | upgrade)
     sudo apt-get $apt_proxy $1
     remove)
     sudo apt-get $1 $2 $3
     purge)
     sudo apt-get remove --purge $2
     install | source)
     sudo apt-get $apt_proxy $1 $2

esac


