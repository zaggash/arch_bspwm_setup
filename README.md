## OS Install

- Setup Internet Wifi access: `$ wifi-menu`
- Clone the repo: `$ git clone --recursive https://github.com/zaggash/arch_bspwm_setup`
- Move to the following folder: `$ cd 01-Arch-install/`
- Execute the initialization script: `$ bash 00-startup.sh`

> Optional Disk Partitioning : `cfdisk`

 - **EFI** partition:
`$ mkfs.fat -F32 -n EFI`
 - **swap** partition:
`$ mkswap`
 - **root** partition:
`$ mkfs.ext4 -L root`
&nbsp;
  - Mount Partitions:
	```
	$ swapon <SWAP_PARTITION>
	$ mount /dev/<ROOT_PARTITION> /mnt
	$ mkdir -p /mnt/boot/efi
	$ mount /dev/<EFI_PARITION> /mnt/boot/efi
	```
 - Execute the **base** arch install in a chroot folder: `$ bash 01-base.sh`

## Prepare Chroot

- Move the cloned git repo folder inside the chroot: `$ mv /root/arch_bspwm_setup /mnt/root/`
- Get into the chrooted env: `$ arch-chroot /mnt`
- Execute the script to finalize the chroot: `$ bash 02-prep-chroot.sh`
- Then:
	```
	    $ exit
	    $ umount -R /mnt
	    $ reboot
	```

## Setup OS

- After the reboot, press **ctrl+alt+F2** and login as **root**
- Move to the git repo folder `arch_bspwm_setup` folder: `$ cd /root/arch_bspwm_setup/`
- Enter in the `02-Arch-configure/` folder: `cd 02-Arch-configure/`
- Start each main scripts one by one to finish the installation.
- Reboot & you're done.

## Activate the backup

Setup the file in `03-Restick-backup` to schedule automatic backup.
This is not setup automatically to avoid any accidental backup override.
