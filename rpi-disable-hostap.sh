#!/bin/bash

# configuration files
sudo cp ./configuration/dhcpcd.conf.orig /etc/dhcpcd.conf
sudo cp ./configuration/dnsmasq.conf.orig /etc/dnsmasq.conf
sudo cp ./configuration/interfaces.orig /etc/network/interfaces
sudo cp ./configuration/hostapd.orig /etc/default/hostapd
#sudo cp ./configuration/hostapd.conf.orig /etc/hostapd/hostapd.conf

# Disable Services
#sudo systemctl disable dhcpcd.service
sudo systemctl disable dnsmasq.service
sudo systemctl disable hostapd.service

# Restart Services
sudo service dnsmasq stop
sudo service hostapd stop 

# Flush IPs and restart networking
sudo ip addr flush dev wlan0
sudo service networking restart

sudo ifdown wlan0
sudo ifup wlan0

sudo service dhcpcd restart
sudo systemctl daemon-reload

echo "rebooting"

sudo reboot
