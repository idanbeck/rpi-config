#!/bin/bash

# configuration files

sudo cp ./configuration/dhcpcd.conf.orig /etc/dhcpcd.conf
sudo cp ./configuration/dnsmasq.conf.orig /etc/dnsmasq.conf

# interface files

if [ -f /etc/network/interfaces.d/wlan0 ] ; then
	sudo rm /etc/network/interfaces.d/wlan0
fi

# services
sudo systemctl disable dhcpcd.service
sudo systemctl disable dnsmasq.service
sudo systemctl disable hostapd.service

sudo service dnsmasq stop
sudo service hostapd stop
sudo service dhcpcd stop

# flush ip
sudo ip flush dev wlan0
sudo service networking restart 

sudo ifdown wlan0
sudo ifup wlan0

sudo systemctl enable dhcpcd.service

sudo service dhcpcd restart
sudo systemctl daemon-reload

echo "disabled ad-hoc, rebooting..."

sudo reboot
