#!/bin/bash
set -e

echo "## Install bluetooth packages ##"
sudo pacman -Syyu --noconfirm --needed \
    pulseaudio-bluetooth \
    bluez \
    bluez-libs \
    bluez-utils \
    blueberry 


echo "## Enable bluetooth packages ##"
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

echo "## Start bluetooth on boot ##"
sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf

echo "## Bluetooth packages installed, Please reboot... ##"
