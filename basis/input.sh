#!/bin/bash
# This script is to install the fcitx input method, sogoupinyin is installed by default.
# the wubi is optional, the default ibus or scim will be removed.

sudo apt-get remove ibus scim
sudo add-apt-repository ppa:fcitx-team/nightly
sudo apt-get update

sudo apt-get install fcitx fcitx-table-wbpy
sudo apt-get install im-switch
im-switch -s fcitx -z default
