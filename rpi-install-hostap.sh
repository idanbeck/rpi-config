#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install cmake
sudo apt-get -y install bc libusb-dev libdbus-1-dev libglib2.0-dev libudev-dev libical-dev libreadline-dev autoconf
sudo apt-get -y install pigpio
sudo apt-get -y install zbar-tools # Press (Y) when asked
sudo apt-get -y install screen # (optional) makes development sessions a little easier
sudo apt-get -y install ntpdate # (optional) allows setting Pi's clock from remote NTP servers
sudo apt-get -y install vim
sudo apt-get -y install git
sudo apt-get -y install socat
sudo apt-get autoremove # remove packages that are no longer needed
sudo apt-get clean # remove cached packages to save disk space

