#!/bin/bash
# Indicator Synapse is a global search tool as spotlight on Mac OS.
# default keymap is super+alt+space, dconf-editor can change this.
# remove it use dpkg.
# this tool is hard to install, when i trys, it want some 32bits packages on my
# 64bits os-system, so puzzle, well you need to collect to dependeces use google
# like "libXXX raring" to http://packages.ubuntu.com/ and find it yourself.
# here only raring-64 provided in extend/packages.
# Maybe it can use after ubuntu 12.04, i do not know,you can try.
# daily build @ https://code.launchpad.net/~elementary-os/+recipe/indicator-synapse-daily
# Project site:   https://launchpad.net/synapse-project
# 13.10 has more dependience.
if ["$THIS_UBUNTU_VERSION" = "13.10" ]; then
rep_site="https://launchpad.net/~boramism/+archive/ppa/+files"
	wget $rep_site/libgranite-common_0.2.2-0ubuntu0_all.deb
if [ "$THIS_SYSTEM_ARCH" = "64"]; then
	wget $rep_site/libgranite1_0.2.2-0ubuntu0_amd64.deb -o libgranite1_0.2.2-0ubuntu0.deb
else
	wget $rep_site/libgranite1_0.2.2-0ubuntu0_i386.deb -o libgranite1_0.2.2-0ubuntu0.deb
fi
	sudo dpkg -i libgranite-common_0.2.2-0ubuntu0_all.deb
	sudo dpkg -i libgranite1_0.2.2-0ubuntu0.deb	
fi

# normal 32bits should use apt to install.
if [ "$THIS_SYSTEM_ARCH" = "32"]; then
	sudo add-apt-repository ppa:birdie-team/stable
	sudo add-apt-repository ppa:elementary-os/unstable-upstream
	sudo apt-get update
	sudo apt-get install indicator-synapse
	return
fi

rep_site="http://mirrors.kernel.org/ubuntu/pool"
wget $rep_site/universe/g/gtkhotkey/libgtkhotkey1_0.2.1-5_amd64.deb -o libgtkhotkey1.deb
wget $rep_site/main/libu/libunique/libunique-1.0-0_1.1.6-4build1_amd64.deb -o libunique.deb
wget $rep_site/universe/k/keybinder-3.0/libkeybinder-3.0-0_0.3.0-0ubuntu1_amd64.deb -o libkeybinder.deb
wget http://launchpadlibrarian.net/138115629/synapse_0.2.10-2ubuntu2_amd64.deb -o synapse.deb
sudo dpkg -i libgtkhotkey.deb
sudo dpkg -i libunique.deb
sudo dpkg -i libkeybinder.deb
sudo dpkg -i synapse.deb