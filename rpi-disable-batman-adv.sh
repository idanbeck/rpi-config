#!/bin/bash

# Remove the interfaces

if [ -f /etc/network/interfaces.d/bat0 ] ; then
	rm /etc/network/interfaces.d/bat0
fi

if [ -f /etc/network/interfaces.d/wlan0 ] ; then
	rm /etc/network/interfaces.d/wlan0
fi

# Return configuration to normal

sed -i '/batman-adv/d' /etc/modules
sudo cp configuration/dhcpcd.conf.orig /etc/dhcpcd.conf

sudo reboot
