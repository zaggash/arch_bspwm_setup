#!/bin/bash
set -e

echo "## Install Thinkpad Carbon Carbon X1 Gen7 specific packages ##"
## Lenovo throttled fix
sudo pacman -Syyu --noconfirm --needed \
	throttled \
	acpi_call \
	sof-firmware
	
echo "## Setup X1C7 sound/microphone ##"
echo "\
blacklist snd_hda_intel
blacklist snd_soc_skl " \
	> /etc/modprobe.d/blacklist.conf

echo "## Setup Touchpad config ##"
sudo install -Dm 644 system/X11/etc/X11/xorg.conf.d/30-touchpad.conf /etc/X11/xorg.conf.d/

echo "## Enable Lenovo throttled Fix ##"
sudo systemctl enable lenovo_fix.service

