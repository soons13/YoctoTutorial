#!/bin/bash

TOP_DIR=`pwd`

if [ -d poky ]; then
    echo "poky is already exist."
else
    git clone git://git.yoctoproject.org/poky
    cd poky
    git checkout dunfell
    cd -
fi

source poky/oe-init-build-env build_qemu
BUILD_DIR=`pwd`

OLD_MACHINE="MACHINE ??= \"qemux86-64\""
NEW_MACHINE="MACHINE := \"qemuarm\""
echo $OLD_MACHINE
echo $NEW_MACHINE
sed -i "s/$OLD_MACHINE/$NEW_MACHINE/g" conf/local.conf

if [ -d meta-raspberrypi ]; then
    echo "meta-raspberrypi is already exist."
else
cd $TOP_DIR
    git clone git://git.yoctoproject.org/meta-raspberrypi
    cd meta-raspberrypi/
    git checkout dunfell
fi

if [ -d meta-openembedded ]; then
    echo "meta-openembedded is already exist."
else
    cd $TOP_DIR
    git clone git://git.openembedded.org/meta-openembedded
    cd meta-openembedded/
    git checkout dunfell
fi

cd $BUILD_DIR
bitbake-layers show-layers
bitbake-layers add-layer ../meta-openembedded/meta-oe/
bitbake-layers add-layer ../meta-openembedded/meta-python/
bitbake-layers add-layer ../meta-openembedded/meta-multimedia/
bitbake-layers add-layer ../meta-openembedded/meta-networking/
bitbake-layers add-layer ../meta-raspberrypi/
bitbake-layers show-layers

bitbake core-image-minimal

