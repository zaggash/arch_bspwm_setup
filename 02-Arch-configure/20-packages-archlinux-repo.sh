#!/bin/bash
set -e

echo "## Software from standard ArchLinux repos ##"

echo "## Utilities ##"
sudo pacman -Syyu --noconfirm --needed \
    feh \
    arandr \
    picom \
    rofi \
    python-pywal \
    network-manager-applet \
    networkmanager-openvpn \
    lxappearance-gtk3 \
    git \
    unrar \
    zip \
    unzip \
    p7zip \
    rclone \
    restic

echo "## Devel ##"
sudo pacman -Syyu --noconfirm --needed \
    alacritty \
    fzf \
    neovim \
    jq

echo "## Graphics ##"
sudo pacman -Syyu --noconfirm --needed \
    neofetch \
    maim

echo "## Internet ##"
sudo pacman -Syyu --noconfirm --needed \
    firefox \
    youtube-dl \
    speedtest-cli

echo "## Multimedia ##"
sudo pacman -Syyu --noconfirm --needed \
    vlc

#echo "## Office ##"
#sudo pacman -Syyu --noconfirm --needed \
#    libreoffice-fresh

echo "## System ##"
sudo pacman -Syyu --noconfirm --needed \
    pacman-contrib \
    arc-gtk-theme \
    gtk-engine-murrine \
    accountsservice \
    dunst \
    cronie \
    hwinfo \
    dmidecode \
    lm_sensors \
    lsb-release \
    mlocate \
    xdotool \
    tree \
    rsync \
    htop \
    curl \
    wget \
    fuse2 \
    xdg-user-dirs


