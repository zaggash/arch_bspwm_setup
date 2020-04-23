#!/bin/bash
set -e

echo "## Setup mirrorlist ##"
pacman -S --noconfirm --needed  reflector
reflector --verbose --country 'France' -l 5 -p http --sort rate --save /etc/pacman.d/mirrorlist

echo "## Pacstrap base packages ##"
pacstrap /mnt  \
	base \
	base-devel \
	linux \
	linux-firmware \
	vim

echo "## Generate Fstab ##"
genfstab -U /mnt >> /mnt/etc/fstab
