#!/bin/bash
# Main Script that Init a pure ubuntu work everiment.
# Author: foxfs
# Email: yanpqi@gmail.com
# Version: 0.1

config_file=/etc/apt/sources.list
#config_file=test.list
if [ ! -e $config_file".old" ]; then
#sudo mv $config_file $config_file.old
echo "exsist"
fi

sudo cat /dev/null > $config_file
release_code=`cat /etc/lsb-release |grep "DISTRIB_CODENAME"|sed s/DISTRIB_CODENAME=//`
sources_list=("mirrors.sohu.com" "mirrors.163.com" "tw.archive.ubuntu.com" "ftp.sjtu.edu.cn" "mirror.bjtu.edu.cn" "kr.archive.ubuntu.com" "mirrors.kernel.org")
sources_type=("" "security" "updates" "proposed" "backports")
lists=""
for l in ${sources_list[@]}
do
for t in ${sources_type[@]}
do
echo "deb http://$l/ubuntu/ $release_code-$t universe restricted multiverse main" >> $config_file
echo "deb-src http://$l/ubuntu/ $release_code-$t universe restricted multiverse main" >> $config_file
done
done

sudo apt-get clean  
# 删除  
sudo rm -fR /var/lib/apt/lists/*  
# 新建相应文件夹  
sudo mkdir /var/lib/apt/lists/partial  
# 重新update  
sudo apt-get update --fix-missing

# sometimes you may incounter a apt error like hash not match, please use this.
# sudo apt-get -o Acquire::http::proxy="http://127.0.0.1:8087/" update
