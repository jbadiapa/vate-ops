#!/bin/bash
vagrant destroy rabbit -f 
vagrant destroy redis -f
vagrant destroy sensu -f
vagrant destroy uchiwa -f
vagrant destroy fluent -f
vagrant destroy elastic -f
vagrant destroy kibana -f
vagrant destroy grafana -f
vagrant destroy collectd -f

