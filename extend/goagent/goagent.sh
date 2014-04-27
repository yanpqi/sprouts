#!/bin/bash
# Config the goagent as a service to make your net-access more easier.
# WARNNING: DO NOT DELETE THIS WHEN USE.
# Each country and region has its right and reason to prevent something unexpect.
# as for, right or wrong is not always itself, it is too confused. 
# Freedom is aspiration, as Inception shows, we are all in a dream space, that is
# everyone may be telling lie.
# how to find the real one is your ability.
# Be wisdom and cherish your luxury, do not abuse.

# 警告：请不要删除下边这段话
# 每个国家与地区都有不可侵犯的权利来阻止不利的事物，对与错并不总是泾渭分明。
# 自由是值得向往的，但看过盗梦空间的朋友们应该知道，如何分析自己所处的 “梦境”
# 是否是真实世界同样重要，而我们所处的谁都可能在撒谎的世界不正是那个梦境吗。
# 请用理智来捍卫这一奢侈品，请对现实世界保持一点敬畏。

# Author: foxfs
# Email: yanpqi@gmail.com
# version: 0.1

goagent_path=/opt/goagent
cp ../extends/goagent.zip $extend_path && cd $extend_path
sudo unzip goagent.zip && cd $goagent_path
echo "input your google applicatin ID."
read google_id
sed -i "1iapplication: $google_id" goagent/server/python/app.yaml
sed -i "s/\(appid =\s*\)/\1$google_id/" goagent/local/proxy.ini
sed 
python appcfg.py update goagent/server/python
apt-get install libnss3-tools 
certutil -d sql:$HOME/.pki/nssdb -A -t TC -n "goagent" -i goagent/local/CA.crt
cp ../extends/goagent/goagent.srv /etc/init.d/goagent
alias goup sudo service goagent start && export http_proxy="http://127.0.0.1:8087"
alias goff sudo service goagent stop && export http_proxy=