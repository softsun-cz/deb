#!/bin/sh

echo -n > /etc/motd
apt update
apt -y remove vim-tiny nano
apt -y upgrade
apt-get -y install ssh mc net-tools bc
echo "alias ls='ls -la --color=auto --group-directories-first'" >> /root/.bashrc
sed -i -e 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i -e 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet/GRUB_CMDLINE_LINUX_DEFAULT="quiet consoleblank=0/g' /etc/default/grub
sed -i -e 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=1/g' /etc/default/grub
update-grub
reboot
