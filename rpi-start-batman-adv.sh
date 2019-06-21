#!/bin/bash

sudo cp configuration/bat0.batmanadv /etc/network/interfaces.d/bat0
sudo cp configuration/wlan0.batmanadv /etc/network/interfaces.d/wlan0

echo 'batman-adv' | sudo tee --append /etc/modules
sudo cp configuration/dhcpcd.conf.batmanadv /etc/dhcpcd.conf

# Interface to use
sudo batctl if add wlan0

# Activate interface for batman-adv
sudo ifconfig wlan0 up
sudo ifconfig bat0 up

sudo reboot
