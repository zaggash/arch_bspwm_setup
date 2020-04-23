#!/bin/bash
set -e

echo "## Set X11 keymap ##"
sudo localectl set-x11-keymap fr

echo "## Setup journald ##"
sudo sed 's/^#SystemMaxUse.*/SystemMaxUse=128M/g' /etc/systemd/journald.conf


echo "## Setup pacman.conf ##"
sudo sed -i 's/^#Color/Color/g'  /etc/pacman.conf
sudo sed -i 's/^#TotalDownload/TotalDownload/g'  /etc/pacman.conf
sudo sed -i 's/^#VerbosePkgLists/VerbosePkgLists/g'  /etc/pacman.conf
sudo sed -i '/^VerbosePkgLists/a ILoveCandy' /etc/pacman.conf

echo "## Set default Breeze Cursor ##"
echo "\
[Icon Theme]
Inherits=Breeze_Snow" > /usr/share/icons/default/index.theme

echo "## Create Personal folders ##"
xdg-user-dirs-update
xdg-user-dirs-update --force

echo "## Install Arc Themes ##"
sudo cp -R system/arc-themes/usr/share/themes/* /usr/share/themes/
sudo chown -R root.root /usr/share/themes/

echo "## Install cron ##"
sudo echo "/usr/bin/reflector --connection-timeout 2  -l 100 -f 50 --n 10 --sort rate --save /etc/pacman.d/mirrorlist" > /etc/cron.daily/mirrorlist

echo "## Install Pacman Hooks ##"
sudo echo "\
[Trigger]
Operation = Upgrade
Operation = Install
Operation = Remove
Type = Package
Target = *

[Action]
Description = Cleaning Pacman cache...
When = PostTransaction
Depends = paccache
Exec = /bin/sh -c 'paccache -r && echo \"[HOOK] Cache packages cleaned !\"'
" > /etc/pacman.d/hooks/clean_package_cache.hook

sudo echo "\
[Trigger]
Operation = Upgrade
Type = Package
Target = pacman-mirrorlist

[Action]
Description = Updating /etc/pacman.d/mirrorlist with reflector and removing /etc/pacman.d/mirrorlist.pacnew
When = PostTransaction
Depends = reflector
Exec = /bin/sh -c 'reflector --protocol https --latest 30 --number 20 --sort rate --save /etc/pacman.d/mirrorlist && rm -f /etc/pacman.d/mirrorlist.pacnew && echo \"[HOOK] Mirrorlist updated...\"'
" > /etc/pacman.d/hooks/mirrorupgrade.hook


echo "## Install modprobe config ##"
sudo install -Dm 644 system/modprobe/etc/modprobe.d/*.conf /etc/modprobe.d/

echo "## Enable Cronie systemd ##"
sudo systemctl enable cronie.service
sudo systemctl start cronie.service

echo "## Apply betterlockscreen config ##"
sudo install -d "/etc/systemd/system/betterlockscreen@$USER.service.d/"
sudo echo "\
[Service]
ExecStart=
ExecStart=/usr/bin/betterlockscreen --lock dimblur
" > "/etc/systemd/system/betterlockscreen@$USER.service.d/override.conf"

echo "## Enable betterlockscreen as $USER ##"
sudo systemctl enable betterlockscreen@$USER
