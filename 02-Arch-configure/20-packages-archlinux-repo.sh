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
    xfce4-power-manager \
    xfce4-screenshooter \
    xfce4-notifyd \
    network-manager-applet \
    networkmanager-openvpn \
    lxappearance-gtk3 \
    qt5ct \
    git \
    unrar \
    zip \
    unzip \
    p7zip \
    thunar \
    thunar-archive-plugin \
    thunar-volman \
    tumbler \
    ffmpegthumbnailer \
    gvfs \
    gvfs-mtp\
    rclone \
    restic
    #variety

echo "## Devel ##"
sudo pacman -Syyu --noconfirm --needed \
    alacritty \
    fzf \
    neovim \
    jq

echo "## Graphics ##"
sudo pacman -Syyu --noconfirm --needed \
    neofetch \
    ristretto \
    scrot

echo "## Internet ##"
sudo pacman -Syyu --noconfirm --needed \
    firefox \
    youtube-dl

echo "## Multimedia ##"
sudo pacman -Syyu --noconfirm --needed \
    vlc

echo "## Office ##"
sudo pacman -Syyu --noconfirm --needed \
    libreoffice-fresh

echo "## System ##"
sudo pacman -Syyu --noconfirm --needed \
    arc-gtk-theme \
    gtk-engine-murrine \
    accountsservice \
    cronie \
    hwinfo \
    dmidecode \
    lm_sensors \
    lsb-release \
    mlocate \
    xdotool \
    tree \
    htop \
    curl \
    wget \
    xdg-user-dirs


