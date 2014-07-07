#!/bin/bash
# Main Script that Init a pure ubuntu work everiment.
# Project: Sprouts
# Author: foxfs
# Email: yanpqi@gmail.com
# Version: 0.1

echo "Thank you for Choose this Product,all we hope is to give you a happy start of Unbutn."
echo "step 1: collecting system infomation."
sudo ./system/main.sh
echo "step 2: Install basic system tools."
sudo ./basis/main.sh
echo "step 3: Install extension tools."
sudo ./extend/main.sh
echo "step 4: Optimize your system."
sudo ./speeder/main.sh
echo "step 5: Clean the rubish."
sudo ./cleaner.sh