#!/bin/bash

# configuration files
sudo cp ./configuration/dhcpcd.conf.hostap /etc/dhcpcd.conf
sudo cp ./configuration/dnsmasq.conf.hostap /etc/dnsmasq.conf
sudo cp ./configuration/interfaces.hostap /etc/network/interfaces
sudo cp ./configuration/hostapd.hostap /etc/default/hostapd
sudo cp ./configuration/hostapd.conf.hostap /etc/hostapd/hostapd.conf

# Enable Services
sudo systemctl enable dhcpcd.service
sudo systemctl enable dnsmasq.service
sudo systemctl enable hostapd.service

# Restart Services
sudo service dhcpcd restart
sudo service dnsmasq restart
sudo service hostapd restart 

# Flush IPs and restart networking
sudo ip addr flush dev wlan0
sudo service dhcpcd restart 
sudo service networking restart

sudo ifdown wlan0
sudo ifup wlan0

sudo systemctl enable dhcpcd
sudo systemctl daemon-reload

echo "rebooting"

sudo reboot
