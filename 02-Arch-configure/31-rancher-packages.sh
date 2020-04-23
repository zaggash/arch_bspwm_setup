#!/bin/bash
set -e

echo "## Install Rancher Specific softwares ##"

sudo pacman -Syyu --noconfirm --needed \
	terraform \
	helm \
	httpie \
	kubectx

yay -Syyu  --removemake --noconfirm \
	slack-desktop \
	zoom \
	vscodium-bin \
	github-cli \
	doctl-bin \
	azure-cli \
	lnav

