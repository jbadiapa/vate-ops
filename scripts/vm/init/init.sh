#!/bin/bash
yum update
yum upgrade -y

yum install iptables-services -y
systemctl enable iptables
systemctl start iptables
