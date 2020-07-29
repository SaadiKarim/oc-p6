# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"

  config.vm.define "recette" do |recette|
    recette.vm.hostname = "recette"
    recette.vm.provision "shell", path: "./scripts/recette.sh"
    recette.vm.network "forwarded_port", guest: 8000, host: 8010
    recette.vm.network "private_network", ip: "192.168.34.10"
    recette.vm.synced_folder ".", "/vagrant", type: "nfs"
    recette.vm.provider "virtualbox" do |v|
      v.memory = 512
    end
  end

  config.vm.define "production" do |production|
    production.vm.hostname = "production"
    production.vm.provision "shell", path: "./scripts/production.sh"
    production.vm.network "forwarded_port", guest: 8000, host: 8080
    production.vm.network "private_network", ip: "192.168.34.20"
    production.vm.synced_folder ".", "/vagrant", type: "nfs"
    production.vm.provider "virtualbox" do |v|
      v.memory = 512
    end
  end

  config.vm.define "dev" do |dev|
    dev.vm.hostname = "dev"
    dev.vm.provision "shell", path: "./scripts/dev.sh"
    dev.vm.network "forwarded_port", guest: 8000, host: 8081
    dev.vm.network "private_network", ip: "192.168.34.30"
    dev.vm.provider "virtualbox" do |v|
      v.memory = 512
    end
  end

  config.vm.define "gitlab-vm" do |gitlabvm|
    gitlabvm.vm.box = "debian/buster64"
    gitlabvm.vm.box_url = "debian/buster64"
    gitlabvm.vm.hostname = "GITLAB-VM"
    gitlabvm.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
    gitlabvm.vm.network "forwarded_port", guest: 80, host: 80
    gitlabvm.vm.network "private_network", ip: "192.168.34.40"
    gitlabvm.vm.provision "docker"
    gitlabvm.vm.provision "shell", path: "./scripts/gitlab.sh"
  end
end
