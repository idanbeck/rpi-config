#!/bin/bash

wget https://github.com/raspberrypi/linux/archive/raspberrypi-kernel_1.20190215-1.tar.gz
tar -xvf raspberrypi-kernel_1.20190215-1.tar.gz

cd linux-raspberrypi-kernel_1.20190215-1

# use kernel7 if on rpi 3 B+ (kernel for zero w)
KERNEL=kernel
sudo make bcm2709_defconfig
cp ../configuration kernel-bluez-config .config

sudo make -j4 zImage modules dtbs

sudo make modules_install

sudo cp arch/arm/boot/dts/*.dtb /boot/
sudo cp arch/arm/boot/dts/overlays/*.dtb* /boot/overlays/
sudo cp arch/arm/boot/dts/overlays/README /boot/overlays/
sudo cp arch/arm/boot/zImage /boot/$KERNEL.img

echo "kernel rebuilt and deployed for bluez, rebooting..."

#sudo reboot
