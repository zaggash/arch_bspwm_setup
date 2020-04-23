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
	# gstreamer \
	# gst-plugins-good \
	# gst-plugins-bad \
	# gst-plugins-base \
	# gst-plugins-ugly \

echo "## Sound packages installed. ##"
