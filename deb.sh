#!/bin/sh

echo -n > /etc/motd
apt-get -y remove vim-tiny nano
apt-get update && apt-get upgrade
apt-get -y install ssh mc net-tools bc
sed -i -e 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
service ssh restart
echo "alias ls='ls -la --color=auto'" >> /root/.bashrc
reboot
