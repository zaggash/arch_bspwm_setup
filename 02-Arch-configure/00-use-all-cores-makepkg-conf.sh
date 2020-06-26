#!/bin/bash
echo "## Edit makepkg config file ##"
numberofcores=$(grep -c ^processor /proc/cpuinfo)

if [ $numberofcores -gt 1 ]
then
        echo "You have $numberofcores cores."
        echo "Changing the makeflags for $numberofcores cores."
        sudo sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j'$numberofcores'"/g' /etc/makepkg.conf
        echo "Changing the compression settings for $numberofcores cores."
        sudo sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T 0 -z -)/g' /etc/makepkg.conf
else
        echo "No change."
fi


echo "##  All cores will be used during building and compression ##"
