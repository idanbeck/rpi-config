#!/bin/bash
echo "Installing BlueZ"

sudo apt-get update
sudo apt-get install libusb-dev libdbus-1-dev libglib2.0-dev libudev-dev libical-dev libreadline-dev -y

cd ~/dev/
mkdir bluez
cd bluez

wget https://s3.amazonaws.com/json-c_releases/releases/json-c-0.13.tar.gz
tar -xvf json-c-0.13.tar.gz
cd json-c-0.13
sudo ./configure --prefix=/usr --disable-static
sudo make
sudo make install

cd ..

wget https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.6.tar.xz
tar -xvf ell-0.6.tar.xz
cd ell-0.6
sudo ./configure --prefix=/usr
sudo make
sudo make install

cd ..

wget www.kernel.org/pub/linux/bluetooth/bluez-5.50.tar.xz
tar xvf bluez-5.50.tar.xz
cd bluez-5.50

sudo ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc --localstatedir=/var --enable-mesh 

sudo make 
sudo make install

sudo cp /usr/lib/bluetooth/bluetoothd configuration/bluetoothd.orig
sudo ln -sf /usr/libexec/bluetooth/bluetoothd /usr/lib/bluetooth/bluetoothd

sudo systemctl daemon-reload


echo "Check to ensure version 5.50"
bluetoothd -v
meshctl -v

echo "installation complete, rebooting..."

#sudo reboot

