#!/bin/bash

if [ -d poky ]; then
    echo "poky is already exist."
else
    git clone git://git.yoctoproject.org/poky
    cd poky
    git checkout dunfell
    cd -
fi

source poky/oe-init-build-env build_qemu

OLD_MACHINE="MACHINE ??= \"qemux86-64\""
NEW_MACHINE="MACHINE := \"qemuarm\""
echo $OLD_MACHINE
echo $NEW_MACHINE
sed -i "s/$OLD_MACHINE/$NEW_MACHINE/g" conf/local.conf

bitbake core-image-minimal

