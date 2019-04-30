#!/bin/bash

# create ssh-keys, if not already existing & add publickey to authorized keys
cat /dev/zero | ssh-keygen -q -N ""
cat /var/lib/jenkins/.ssh/id_rsa.pub >> /var/lib/jenkins/.ssh/authorized_keys

# make shure directory exists - innitiates git repo automatically
#git init ./root/data
#service jenkins start
#service ssh start

sudo service ssh start
sudo service jenkins start

bash
