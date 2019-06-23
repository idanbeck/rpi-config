#!/bin/bash

mkdir rpi-kernel && cd rpi-kernel
sudo apt-get install -y git bc libncurses5-dev

git clone https://github.com/raspberrypi/tools
cd tools
echo PATH=\$PATH:$(pwd)/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin | tee -a ~/.bashrc
source ~/.bashrc

wget https://github.com/raspberrypi/linux/archive/raspberrypi-kernel_1.20190215-1.tar.gz
tar -xvf raspberrypi-kernel_1.20190215-1.tar.gz
cd linux-raspberrypi-kernel_1.20190215-1

# use kernel7 if on rpi 3 B+ (kernel for zero w)
KERNEL=kernel
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bcm2709_defconfig
cp ../../configuration kernel-bluez-config .config

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- zImage modules dtbs -j6

echo "kernel cross compiled, use rpi-wsl-install-kernel-sd-card.sh to deploy to SD Card..."

