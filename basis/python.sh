#!/bin/bash
# build a python enveriment.
# by defult 11.10 python2.6|12.04 python2.7|13.04 python 3.3
# multiversion pythons can exsist in one ubuntu, and you need either give versin in
# .py file or use python2.7 X.py etc.
# virtualenv is a tool to manage multe-python.

# fetch python version。use 2>&1 to port stderr stream to stdout.
py_version=`python -V 2>&1|awk '{print $2}'`
py_V1=`python -V 2>&1|awk '{print $2}'|awk -F '.' '{print $1}'`
py_V2=`python -V 2>&1|awk '{print $2}'|awk -F '.' '{print $2}'`

if [[ "$py_V1" gt 2 ]]; then
	install="python2.7 python2.7-dev"
elif [[ "$py_V1" = "2" ]]; then
	if [[ "$py_V2" lt 7 ]]; then
		install ="python2.7 python2.7-dev python3.2 python3.2-dev"
	else
		install="python3.2 python3.2-dev"
		#statements
	fi
else
	install="python2.7 python2.7-dev"
fi
	#statements
# 安装 Python 发布版本，dev包必须安装，很多用pip安装包都需要编译
sudo apt-get install $install
# 很多pip安装的包都需要libssl和libevent编译环境
sudo apt-get install build-essential libssl-dev libevent-dev libjpeg-dev libxml2-dev libxslt-dev

# 安装 pip
sudo apt-get install python-pip
# 安装 virtualenv
sudo pip install virtualenv

# 安装 python2.7 virtualenv
virtualenv --no-site-packages -p /usr/bin/python2.7 ~/.venv/python2.7

# 安装 python3.2 virtualenv
virtualenv --no-site-packages -p /usr/bin/python3.2 ~/.venv/python3.2

# 缺省激活python2.7环境
if [ -f ~/.venv/python2.7/bin/activate ]; then
    . ~/.venv/python2.7/bin/activate
fi