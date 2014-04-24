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
sources_list=("mirrors.sohu.com" "mirrors.163.com" "tw.archive.ubuntu.com" "ftp.sjtu.edu.cn" "mirror.bjtu.edu.cn")
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
cat $config_file
