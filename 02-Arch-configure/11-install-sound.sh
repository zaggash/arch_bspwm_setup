#!/bin/bash
set -e

echo "## Install sound packages ##"
sudo pacman -Syyu --noconfirm --needed \
	pulseaudio \
	pulseaudio-alsa \
	pavucontrol \
	volumeicon \
	alsa-utils \
	alsa-plugins \
	alsa-lib \
	alsa-firmware

echo "## Sound packages installed. ##"
