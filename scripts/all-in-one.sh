#!/bin/bash
vagrant up all  --provider virtualbox

####
# Git clone if the directory does not exits
##
if [ ! opstools-ansible ]; then 
 git clone https://github.com/centos-opstools/opstools-ansible.git
fi

####
#Create Certs
##
./scripts/cert-testca.sh
./scripts/cert-server.sh
./scripts/cert-client.sh
#

cd opstools-ansible

#####
# Get the review if it is given  
##
if [ $# = 1 ]; then
 REVIEW=$1
 git review -d $REVIEW
else
 git checkout master
fi

#####
# Creates the inventoy file
##
cd inventory
cat >hosts<<EOF
[am_hosts]
192.168.33.51
[pm_hosts]
[logging_hosts]

[targets]
192.168.33.51 ansible_user=vagrant ansible_ssh_extra_args='-i ../.vagrant/machines/all/virtualbox/private_key -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no' ansible_become=True ansible_become_user=root ansible_become_method=sudo
EOF
cd ..

####
# Generate params.yml
###

function start_with(){
	FILETOCHANGE=$1
	TEXT=$2
	sed -i -e "s/^/$TEXT/g" $FILETOCHANGE
}

function set_ssl_var(){
	FILE=$1
	VAR=$2
	SSL_FILE=$3
	LINES=`wc -l $SSL_FILE | awk '{print $1}'`
	if [ $LINES -gt 1 ]; then
	   start_with $SSL_FILE "  "
           cat >>$FILE<<EOF
$VAR: |
EOF
           cat $SSL_FILE >> $FILE
	   cat >>$FILE<<EOF

EOF
        fi
}
cat >params.yml<<EOF
---

rabbitmq_use_ssl: true
sensu_rabbitmq_with_ssl: true
EOF
set_ssl_var params.yml rabbitmq_ssl_cacert ../testca/cacert.pem
set_ssl_var params.yml rabbitmq_ssl_cert ../server/cert.pem 
set_ssl_var params.yml rabbitmq_ssl_key ../server/key.pem
set_ssl_var params.yml sensu_rabbitmq_ssl_cert ../client/cert.pem
set_ssl_var params.yml sensu_rabbitmq_ssl_key ../client/key.pem
ansible-playbook -i inventory playbook.yml -e @params.yml
