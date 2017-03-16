# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"
  config.vm.provision "shell", path: "scripts/vm/init/init.sh"
  # all in one
  config.vm.define "all" do |all|
   all.vm.network "public_network", bridge: "enp0s31f6", ip: "192.168.1.52", :mac => "080027123450"
   all.vm.network "private_network", ip: "192.168.33.51", :mac => "080027123470"
   all.vm.hostname = "all"
  end
  # split in servers
  config.vm.define "am" do |am|
   am.vm.network "public_network", bridge: "enp0s31f6", ip: "192.168.1.64", :mac => "080027123451"
   am.vm.network "private_network", ip: "192.168.33.64", :mac => "080027123471"
   am.vm.hostname = "availability"
  end

  config.vm.define "log" do |log|
   log.vm.network "public_network", bridge: "enp0s31f6", ip: "192.168.1.53", :mac => "080027123452"
   log.vm.network "private_network", ip: "192.168.33.53", :mac => "080027123472"
   log.vm.hostname = "availability"
  end

  config.vm.define "pm" do |pm|
   pm.vm.network "public_network", bridge: "enp0s31f6", ip: "192.168.1.54", :mac => "080027123453"
   pm.vm.network "private_network", ip: "192.168.33.54", :mac => "080027123473"
   pm.vm.hostname = "performance"
  end

  #split in services
  config.vm.define "rabbit" do |rabbit|
   rabbit.vm.network "public_network", bridge: "enp0s31f6", ip: "192.168.1.55", :mac => "080027123454"
   rabbit.vm.network "private_network", ip: "192.168.33.55", :mac => "080027123474"
   rabbit.vm.hostname = "availability"
  end

  config.vm.define "redis" do |redis|
   redis.vm.network "public_network", bridge: "enp0s31f6", ip: "192.168.1.56", :mac => "080027123455"
   redis.vm.network "private_network", ip: "192.168.33.56", :mac => "080027123475"
   redis.vm.hostname = "availability"
  end

  config.vm.define "sensu" do |sensu|
   sensu.vm.network "public_network", bridge: "enp0s31f6", ip: "192.168.1.57", :mac => "080027123456"
   sensu.vm.network "private_network", ip: "192.168.33.57", :mac => "080027123476"
   sensu.vm.hostname = "availability"
  end

  config.vm.define "uchiwa" do |uchiwa|
   uchiwa.vm.network "public_network", bridge: "enp0s31f6", ip: "192.168.1.58", :mac => "080027123457"
   uchiwa.vm.network "private_network", ip: "192.168.33.58", :mac => "080027123477"
   uchiwa.vm.hostname = "availability"
  end

  config.vm.define "fluent" do |fluent|
   fluent.vm.network "public_network", bridge: "enp0s31f6", ip: "192.168.1.59", :mac => "080027123458"
   fluent.vm.network "private_network", ip: "192.168.33.59", :mac => "080027123478"
   fluent.vm.hostname = "availability"
  end

  config.vm.define "elastic" do |elastic|
   elastic.vm.network "public_network", bridge: "enp0s31f6", ip: "192.168.1.60", :mac => "080027123459"
   elastic.vm.network "private_network", ip: "192.168.33.60", :mac => "080027123479"
   elastic.vm.hostname = "availability"
  end

  config.vm.define "kibana" do |kibana|
   kibana.vm.network "public_network", bridge: "enp0s31f6", ip: "192.168.1.61", :mac => "08002712345a"
   kibana.vm.network "private_network", ip: "192.168.33.61", :mac => "08002712347a"
   kibana.vm.hostname = "availability"
  end

  config.vm.define "grafana" do |grafana|
   grafana.vm.network "public_network", bridge: "enp0s31f6", ip: "192.168.1.62", :mac => "08002712345b"
   grafana.vm.network "private_network", ip: "192.168.33.62", :mac => "08002712347b"
   grafana.vm.hostname = "availability"
  end

  config.vm.define "collectd" do |collectd|
   collectd.vm.network "public_network", bridge: "enp0s31f6", ip: "192.168.1.63", :mac => "08002712345c"
   collectd.vm.network "private_network", ip: "192.168.33.63", :mac => "08002712347c"
   collectd.vm.hostname = "availability"
  end

  config.vm.define "centos" do |centos|
   centos.vm.network "public_network", bridge: "enp0s31f6", type: "dhcp"
   centos.vm.network "private_network", ip: "192.168.33.78"
   centos.vm.hostname = "centos"
  end

  config.vm.define "os-mig" do |osmig|
   osmig.vm.network "public_network", bridge: "enp0s31f6", type: "dhcp"
   osmig.vm.network "private_network", ip: "192.168.33.79"
   osmig.vm.hostname = "os-mig"
  end

end
