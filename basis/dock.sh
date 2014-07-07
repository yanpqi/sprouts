#!/bin/bash
# This is a script to install a launchpad for your ubuntu.

# docky
# theme please visit @ http://browse.deviantart.com/?qh=&section=&global=1&q=docky
#                or  @ http://wiki.go-docky.com/index.php?title=Themes
sudo add-apt-repository ppa:docky-core/ppa
sudo apt-get update
sudo apt-get install docky

# Avant


# GLX-Dock
sudo add-apt-repository ppa:cairo-dock-team/ppa 
sudo apt-get update
sudo apt-get install cairo-dock cairo-dock-plug-ins

