#!/bin/bash

# configuration files

sudo cp ./configuration/dhcpcd.conf.adhoc /etc/dhcpcd.conf
sudo cp ./configuration/dnsmasq.conf.adhoc /etc/dnsmasq.conf

# interface files
sudo cp ./configuration/wlan0.adhoc /etc/network/interfaces.d/wlan0

# Services
sudo systemctl enable dhcpcd.service
sudo systemctl disable dnsmasq.service
sudo systemctl disable hostapd.service

# Flush IP
sudo ip addr flush dev wlan0
sudo service dhcpcd restart
sudo service networking restart

sudo ifdown wlan0
sudo ifup wlan0

sudo systemctl daemon-reload

echo "reboot"

sudo reboot 
