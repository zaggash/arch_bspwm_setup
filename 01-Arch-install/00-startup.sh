#!/bin/bash
set -e

echo "## Prep keymap, install git and set time ##"
pacman -S --noconfirm --needed git
loadkeys fr
timedatectl set-ntp true
