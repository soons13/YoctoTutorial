#!/bin/sh
docker stop yocto_tutorial
docker rm yocto_tutorial
docker run -it --privileged -e "TZ=Asia/Seoul" -e "TERM=xterm-256color" --privileged --network=host -v /etc/localtime:/etc/localtime --volume="$PWD/..:/home/yocto_tutorial/yocto" -u yocto_tutorial --name yocto_tutorial yocto_tutorial:v1
