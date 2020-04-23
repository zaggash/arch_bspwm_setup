#!/bin/bash
set -e

echo "## Setup mirrorlist ##"
pacman -S --noconfirm --needed  reflector
reflector --verbose --country 'France' -l 5 -p http --sort rate --save /etc/pacman.d/mirrorlist

echo "## Install default package ##"
pacman -Syyu --noconfirm --needed \
  networkmanager \
  os-prober \
  efibootmgr \
  grub \
  xorg-server \
  xorg-apps \
  xorg-xinit \
  intel-ucode \
  xf86-video-intel \
  man-db \
  man-pages \
  fwupd \
  lightdm \
  bspwm \
  sxhkd \
  zsh \
  git \
  wget \
  curl \
  vim


echo "## Set time ##"
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc

echo "## Set Locale ##"
echo "\
en_US.UTF-8 UTF-8
fr_FR.UTF-8 UTF-8" \
	> /etc/locale.gen

echo "\
LANG=en_US.UTF-8
LC_ADDRESS=fr_FR.UTF-8
LC_IDENTIFICATION=fr_FR.UTF-8
LC_MEASUREMENT=fr_FR.UTF-8
LC_MONETARY=fr_FR.UTF-8
LC_NAME=fr_FR.UTF-8
LC_NUMERIC=fr_FR.UTF-8
LC_PAPER=fr_FR.UTF-8
LC_TELEPHONE=fr_FR.UTF-8
LC_TIME=fr_FR.UTF-8" \
	> /etc/locale.conf

locale-gen

echo "## Set vconsole Keymap ##"
echo "KEYMAP=fr" > /etc/vconsole.conf

echo "## Set Hostname ##"
hostnamectl set-hostname Carbon-X1
echo "Carbon-X1" > /etc/hostname

echo "## Set Root Password ##"
until passwd
do
  echo "Try Again !"
done

echo "## Create user account ##"
useradd -m -g users -G audio,video,network,wheel,storage,rfkill -s /bin/zsh -c "Alex" alexxx || echo "User already exists."
until passwd alexxx
do
  echo "Try Again !"
done

echo "## Setup sudo ##"
echo "\
%wheel ALL=(ALL) ALL
%wheel ALL=(ALL) NOPASSWD: /usr/bin/reboot, /usr/bin/shutdown" \
	> /etc/sudoers.d/10-installer

echo "## Setup grub ##"
mkdir -p /boot/efi/EFI
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub
grub-mkconfig -o /boot/grub/grub.cfg


echo "## Enable Display Manager ##"
systemctl enable lightdm.service
systemctl set-default graphical.target

echo "## Enable NetworkManager ##"
systemctl enable NetworkManager



echo "##########################"
echo "## Reboot and continue  ##"
echo "##########################"
