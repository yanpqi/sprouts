#!/bin/bash
# This script is to config chinese environment.
# environment includes language-pack, locale, input-method

# sudo apt-get install language-selector-gnome this install will remove im-switch
is_chines_in=`locale -a | grep "zh_CN" | wc -l`
if [ is_chines_in -eq 1 ]; then
	exit
fi
# sudo apt-get install language-pack-zh language-pack-zh-base old version use this.
sudo apt-get install language-pack-zh language-pack-zh-base
LANG="zh_CN.UTF-8"
LANGUAGE="zh_CN:zh:en_US:en"
sudo echo "" >> /etc/environment
sudo dpkg-reconfigure locales

# add chinese encodes to make sure display of files from windows.
locales_enc_s=/var/lib/locales/supported.d/zh_hans
locales_enc_t=/var/lib/locales/supported.d/zh_hant
echo -e "zh_CN.GB18030 GB18030\nzh_CN.GBK GBK\nzh_CN.GB2312 GB2312\nzh_CN.GB18031 GB18031" >> locales_enc_s
echo "zh_HK.BIG5 BIG5\nzh_TW.BIG5 BIG5" >> locales_enc_t
sudo locale-gen

# config vim to support GB-code check.
echo "let &termencoding=&encoding" >> ~/.vimrc
echo "set fileencodings=utf-8,gb18030,gbk,gb2312,big5" >> ~/.vimrc

# for gedit, do as below.
# 执行 sudo gconf-editor
# 选择 apps/gedit-2/preferences/encodings
# 找到 auto_detected 编辑，在Values中分别加入 GB18030,GBK,GB2312,BIG5

# sudo apt-get install enca enca is a tool to check the encoding of file.

# /etc/default/locale 这个文件包含了系统的locale系统配置