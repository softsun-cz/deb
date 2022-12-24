#!/bin/sh

echo -n > /etc/motd
apt-get -y remove vim-tiny nano
apt-get update && apt-get upgrade
apt-get -y install ssh mc net-tools bc
echo "alias ls='ls -la --color=auto --group-directories-first'" >> /root/.bashrc
sed -i -e 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i -e 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=1/g' /etc/default/grub
update-grub
reboot
