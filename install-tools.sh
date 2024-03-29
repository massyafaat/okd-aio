#!/bin/bash

# install updates
yum update -y

# install the following base packages
yum install -y  open-vm-tools wget git nano net-tools docker-1.13.1 bind-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct openssl-devel  httpd-tools NetworkManager python-cryptography python-devel  python-passlib java-1.8.0-openjdk-headless "@Development Tools"

#install epel
yum -y install epel-release

yum install zile python2-pip --enablerepo=epel -y

# Disable the EPEL repository globally so that is not accidentally used during later steps of the installation
sed -i -e "s/^enabled=1/enabled=0/" /etc/yum.repos.d/epel.repo

systemctl | grep "NetworkManager.*running"
if [ $? -eq 1 ]; then
        systemctl start NetworkManager
        systemctl enable NetworkManager
fi

# install the packages for Ansible
yum -y --enablerepo=epel install pyOpenSSL

# install Ansible

yum -y --enablerepo=epel install ansible
