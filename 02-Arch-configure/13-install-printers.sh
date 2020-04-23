#!/bin/bash
set -e

echo "## Install Printer packages ##"
sudo pacman -Syyu --noconfirm --needed \
    cups \
    cups-pdf \
    ghostscript \
    gsfonts \
    gutenprint \
    gtk3-print-backends \
    libcups \
    hplip \
    system-config-printer
    ## First try without foomatic
    # foomatic-db-engine
    # foomatic-db \
    # foomatic-db-ppds \
    # foomatic-db-nonfree-ppds \
    # foomatic-db-gutenprint-ppds

echo "## Enable cups systemd ##"
sudo systemctl enable org.cups.cupsd.service

echo "## Printer packages installed, Please Reboot... ##"
