#!/bin/bash
set -e

echo "## Install tlp for battery life - laptops ##"
sudo pacman -Syyu --noconfirm --needed \
    tlp

echo "## Enable TLP systemd service ##"
sudo systemctl enable tlp.service
sudo systemctl start tlp.service

echo "## TLP packages installed. ##"
