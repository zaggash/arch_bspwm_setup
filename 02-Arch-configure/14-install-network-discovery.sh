#!/bin/bash
set -e

echo "## Install Network discovery packages ##"
sudo pacman -Syyu --noconfirm --needed \
    avahi \
    nss-mdns \
    gvfs-smb

echo "## Enable avahi systemd ##"
sudo systemctl enable avahi-daemon.service
sudo systemctl start avahi-daemon.service


echo "## Fix nsswitch NAS discovery ##"
#change nsswitch.conf for access to nas servers
#original line comes from the package filesystem
#hosts: files mymachines myhostname resolve [!UNAVAIL=return] dns
#New line
#hosts: files mymachines resolve [!UNAVAIL=return] mdns dns wins myhostname

#first part
sudo sed -i 's/files mymachines myhostname/files mymachines/g' /etc/nsswitch.conf
#last part
sudo sed -i 's/\[\!UNAVAIL=return\] dns/\[\!UNAVAIL=return\] mdns_minimal \[NOTFOUND=return\] dns wins myhostname/g' /etc/nsswitch.conf


echo "## Network Discovery packages installed. ##"
