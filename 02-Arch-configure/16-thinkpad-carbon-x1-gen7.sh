#!/bin/bash
set -e

## https://wiki.archlinux.org/index.php/Lenovo_ThinkPad_X1_Carbon_(Gen_7)

echo "## Install Thinkpad Carbon Carbon X1 Gen7 specific packages ##"
## Lenovo throttled fix
sudo pacman -Syyu --noconfirm --needed \
	# Lenovo CPU throttle fix
	throttled \
	# Used by tlp on thinkpad
	acpi_call \
	sof-firmware

echo "## Setup Touchpad config ##"
sudo install -Dm 644 system/X11/etc/X11/xorg.conf.d/30-touchpad.conf /etc/X11/xorg.conf.d/

echo "## Enable Lenovo throttled Fix ##"
sudo systemctl enable lenovo_fix.service

