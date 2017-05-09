#!/bin/bash
vagrant up rabbit  --provider virtualbox
vagrant up redis  --provider virtualbox
vagrant up sensu  --provider virtualbox
vagrant up uchiwa  --provider virtualbox

####
# Git clone if the directory does not exits
##
if [ ! opstools-ansible ]; then 
 git clone https://github.com/centos-opstools/opstools-ansible.git
fi

####
#Create Certs
##
# ./scripts/cert-testca.sh
# ./scripts/cert-server.sh
# ./scripts/cert-client.sh
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
[rabbit_hosts]
192.168.33.55

[redis_hosts]
192.168.33.56

[sensu_hosts]
192.168.33.57

[uchiwa_hosts]
192.168.33.58

[fluent_hosts]

[elastic_hosts]

[kibana_hosts]

[grafana_hosts]

[collectd_hosts]


192.168.33.56 ansible_user=vagrant ansible_ssh_extra_args='-i /home/jbadiapa/first-environment/.vagrant/machines/redis/virtualbox/private_key -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no' ansible_become=True ansible_become_user=root ansible_become_method=sudo
192.168.33.57 ansible_user=vagrant ansible_ssh_extra_args='-i /home/jbadiapa/first-environment/.vagrant/machines/sensu/virtualbox/private_key -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no' ansible_become=True ansible_become_user=root ansible_become_method=sudo
192.168.33.58 ansible_user=vagrant ansible_ssh_extra_args='-i /home/jbadiapa/first-environment/.vagrant/machines/uchiwa/virtualbox/private_key -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no' ansible_become=True ansible_become_user=root ansible_become_method=sudo
192.168.33.55 ansible_user=vagrant ansible_ssh_extra_args='-i /home/jbadiapa/first-environment/.vagrant/machines/rabbit/virtualbox/private_key -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no' ansible_become=True ansible_become_user=root ansible_become_method=sudo



EOF
cd ..

#set_ssl_var params.yml rabbitmq_ssl_cacert ../testca/cacert.pem
#set_ssl_var params.yml rabbitmq_ssl_cert ../server/cert.pem 
#set_ssl_var params.yml rabbitmq_ssl_key ../server/key.pem
#set_ssl_var params.yml sensu_rabbitmq_ssl_cert ../client/cert.pem
#set_ssl_var params.yml sensu_rabbitmq_ssl_key ../client/key.pem
#ansible-playbook -i inventory playbook.yml 
