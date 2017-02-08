#!/bin/bash
vagrant up rabbit --provider virtualbox
vagrant up redis --provider virtualbox
vagrant up sensu --provider virtualbox
vagrant up uchiwa --provider virtualbox
vagrant up fluent --provider virtualbox
vagrant up elastic --provider virtualbox
vagrant up kibana --provider virtualbox
vagrant up grafana --provider virtualbox
vagrant up collectd --provider virtualbox
git clone https://github.com/centos-opstools/opstools-ansible.git
pwd
cd opstools-ansible
cd inventory
cat >hosts<<EOF
[rabbit_hosts]
192.168.1.55
[redis_hosts]
192.168.1.56
[sensu_hosts]
192.168.1.57
[uchiwa_hosts]
192.168.1.58
[fluent_hosts]
192.168.1.59
[elastic_hosts]
192.168.1.60
[kibana_hosts]
192.168.1.61
[grafana_hosts]
192.168.1.62
[collectd_hosts]
192.168.1.63

[targets]
192.168.1.55 ansible_user=vagrant ansible_ssh_extra_args='-i ../.vagrant/machines/rabbit/virtualbox/private_key -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no' ansible_become=True ansible_become_user=root ansible_become_method=sudo
192.168.1.56 ansible_user=vagrant ansible_ssh_extra_args='-i ../.vagrant/machines/redis/virtualbox/private_key -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no' ansible_become=True ansible_become_user=root ansible_become_method=sudo
192.168.1.57 ansible_user=vagrant ansible_ssh_extra_args='-i ../.vagrant/machines/sensu/virtualbox/private_key -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no' ansible_become=True ansible_become_user=root ansible_become_method=sudo
192.168.1.58 ansible_user=vagrant ansible_ssh_extra_args='-i ../.vagrant/machines/uchiwa/virtualbox/private_key -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no' ansible_become=True ansible_become_user=root ansible_become_method=sudo
192.168.1.59 ansible_user=vagrant ansible_ssh_extra_args='-i ../.vagrant/machines/fluent/virtualbox/private_key -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no' ansible_become=True ansible_become_user=root ansible_become_method=sudo
192.168.1.60 ansible_user=vagrant ansible_ssh_extra_args='-i ../.vagrant/machines/elastic/virtualbox/private_key -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no' ansible_become=True ansible_become_user=root ansible_become_method=sudo
192.168.1.61 ansible_user=vagrant ansible_ssh_extra_args='-i ../.vagrant/machines/kibana/virtualbox/private_key -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no' ansible_become=True ansible_become_user=root ansible_become_method=sudo
192.168.1.62 ansible_user=vagrant ansible_ssh_extra_args='-i ../.vagrant/machines/grafana/virtualbox/private_key -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no' ansible_become=True ansible_become_user=root ansible_become_method=sudo
192.168.1.63 ansible_user=vagrant ansible_ssh_extra_args='-i ../.vagrant/machines/collectd/virtualbox/private_key -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no' ansible_become=True ansible_become_user=root ansible_become_method=sudo
EOF

cd ..
pwd
ansible-playbook -i inventory playbook.yml
