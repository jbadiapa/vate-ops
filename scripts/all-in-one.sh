#!/bin/bash
vagrant up all  --provider virtualbox
# Git clone if the directory does not exits
if [ ! opstools-ansible ]; then 
 git clone https://github.com/centos-opstools/opstools-ansible.git
fi

#Create Certs
./scripts/cert-testca.sh
./scripts/cert-server.sh
./scripts/cert-client.sh

#

cd opstools-ansible

# Get the review if it is given  
if [ #$ == 1];
 REVIEW = $1
 git review -d $REVIEW
else
 fit checkout master
fi

cd inventory
cat >hosts<<EOF
[am_hosts]
192.168.33.51
[pm_hosts]
192.168.33.51
[logging_hosts]
192.168.33.51

[targets]
192.168.33.51 ansible_user=vagrant ansible_ssh_extra_args='-i ../.vagrant/machines/all/virtualbox/private_key -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no' ansible_become=True ansible_become_user=root ansible_become_method=sudo
EOF

cd ..
pwd
#ansible-playbook -i inventory playbook.yml
