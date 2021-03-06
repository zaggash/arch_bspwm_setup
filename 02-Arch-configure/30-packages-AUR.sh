#!/bin/bash
set -e

if ! pacman -Qe yay > /dev/null
then
  echo "## Install yay ##"
  rm -Rf yay-bin
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -sri --clean --noconfirm --needed
fi

echo "## Replace github yay with yay-bin from AUR ##"
yes | yay -Sy --removemake --answerdiff N --answerclean N yay-bin

echo "Install AUR packages"
yay -Syyu --removemake --noconfirm \
    lightdm-webkit-theme-aether \
    nerd-fonts-hack \
    nerd-fonts-noto-sans-regular-complete \
    xcursor-breeze \
    mojave-ct-icon-theme-git \
    xcwd-git \
    polybar \
    betterlockscreen \
    downgrade \
    informant \
    antibody-bin \
    keybase-bin
