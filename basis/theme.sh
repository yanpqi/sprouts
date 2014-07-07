#!/bin/bash
# This script includes some theme install method, you can choose them.
# More themes at http://bokehlicia.deviantart.com/
# AwOken
# see this http://gnome-look.org/content/show.php/AwOken+-+Awesome+Token+icon+set?content=126344
sudo add-apt-repository ppa:alecive/antigone
sudo apt-get update
sudo apt-get install awoken-icon-theme
# ieOS7
wget -O ieOS7-icons.deb http://goo.gl/MtQBjE
sudo dpkg -i ieOS7-icons.deb
sudo rm ieOS7-icons.deb

# Pacifica
sudo add-apt-repository ppa:fsvh/pacifica-icon-theme
sudo apt-get update
sudo apt-get install pacifica-icon-theme
gsettings set org.gnome.desktop.interface icon-theme "Pacifica"

# Moka
sudo add-apt-repository ppa:snwh/moka-icon-theme-daily
sudo apt-get update
sudo apt-get install moka-icon-theme moka-icon-theme-symbolic moka-icon-theme-extras

# Nitrux
sudo add-apt-repository ppa:upubuntu-com/nitrux
sudo apt-get update
sudo apt-get install nitruxos

# Mac OS X Lion
sudo add-apt-repository ppa:noobslab/themes
sudo apt-get update
sudo apt-get install mac-icons-v2-noobslab
sudo apt-get install mac-ithemes-v2-noobslab
