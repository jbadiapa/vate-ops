#!/bin/bash
yum install iptables-services -y
systemctl enable iptables
systemctl start iptables
