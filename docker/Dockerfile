FROM ubuntu:22.04

# ARG DEBIAN_FRONTEND=noninteractive

RUN sed -i 's/archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list
RUN apt-get clean
RUN apt-get update

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul
RUN apt-get install -y tzdata
# RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata

RUN apt-get install -y ssh build-essential less vim git

RUN apt-get install -y \
    python3 python3-pip python3-pexpect

RUN apt-get install -y locales locales-all
ENV LC_ALL=en_US.UTF-8

RUN apt-get install -y tree
RUN apt-get install -y bc

ENV PORT=8080
EXPOSE $PORT
# ENV DISPLAY=:0.0
# EXPOSE $DISPLAY

RUN echo "alias ll='ls -alF'" >> ~/.bashrc
RUN echo "alias la='ls -A'" >> ~/.bashrc
RUN echo "alias l='ls -CF'" >> ~/.bashrc

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y gawk wget git diffstat unzip texinfo gcc chrpath
RUN apt-get install -y socat cpio python3 python3-pip python3-pexpect 
RUN apt-get install -y xz-utils debianutils 
RUN apt-get install -y iputils-ping
RUN apt-get install -y python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev 
RUN apt-get install -y xterm python3-subunit
RUN apt-get install -y mesa-common-dev zstd liblz4-tool
RUN apt-get install -y iproute2
RUN apt-get install -y file curl
# u-boot dependency
RUN apt-get install -y bison flex
RUN apt-get install -y libssl-dev
RUN apt-get install -y device-tree-compiler
RUN apt-get install -y u-boot-tools
# kernel dependency
RUN apt-get install -y libgmp3-dev
RUN apt-get install -y libmpc-dev
RUN apt-get install -y kmod
RUN apt-get install -y autoconf automake autotools-dev
RUN apt-get install -y pkg-config m4 libtool

RUN apt-get install -y fakeroot libelf-dev xinetd
RUN apt-get install -y tftpd tftp nfs-kernel-server
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y libncurses5 libc6-i386 libstdc++6:i386 libgcc++1:i386 lib32z1

RUN apt-get install -y mtd-utils mtd-tools u-boot-tools net-tools swig
#RUN apt-get install -y libtool
RUN apt-get install -y libncurses-dev



# rootfs dependency
# RUN apt-get install -y pylint3
RUN pip install pylint

VOLUME /home/yocto_tutorial
RUN apt-get update && apt-get install -y sudo
RUN adduser --disabled-password --gecos "" yocto_tutorial  \
    && echo 'yocto_tutorial:user' | chpasswd \
    && adduser yocto_tutorial sudo \
    && echo 'yocto_tutorial ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
    
RUN apt-get install -y tmux

RUN apt-get install -y autoconf automake autotools-dev
RUN apt-get install -y pkg-config m4 libtool
#RUN apt-get install -y libtool
RUN apt-get install -y libncurses-dev

RUN apt install -y openssl curl gnutls-bin

# USER root
ENV USER=yocto_tutorial
USER yocto_tutorial
VOLUME /home/yocto_tutorial/yocto
WORKDIR /home/yocto_tutorial/yocto

RUN sudo ln -sf /bin/bash /bin/sh

RUN echo "alias ll='ls -alF'" >> ~/.bashrc
RUN echo "alias la='ls -A'" >> ~/.bashrc
RUN echo "alias l='ls -CF'" >> ~/.bashrc

RUN git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
RUN sh ~/.vim_runtime/install_awesome_vimrc.sh

RUN echo "filetype plugin indent on" >> ~/.vimrc
RUN echo "set tabstop=4" >> ~/.vimrc
RUN echo "set shiftwidth=4" >> ~/.vimrc
RUN echo "set expandtab" >> ~/.vimrc


CMD ["/bin/bash"]
