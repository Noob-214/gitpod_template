#!/usr/bin/env bash

# Copyright (C) 2018 Harsh 'MSF Jarvis' Shandilya
# Copyright (C) 2018 Akhil Narang
# SPDX-License-Identifier: GPL-3.0-only

# Script to setup an AOSP Build environment on Ubuntu and Linux Mint

sudo apt update -y
sudo DEBIAN_FRONTEND=noninteractive apt install -y adb autoconf automake axel bc bison build-essential ccache clang cmake expat fastboot flex \
    g++ g++-multilib gawk gcc gcc-multilib git-core gnupg gperf htop imagemagick lib32ncurses5-dev lib32z1-dev libtinfo5 \
    libc6-dev libcap-dev libexpat1-dev libgmp-dev liblz4-* liblzma* libmpc-dev libmpfr-dev \
    libncurses5-dev libsdl1.2-dev libssl-dev libtool libxml2 libxml2-utils lzma* lzop maven ncftp ncurses-dev \
    patch patchelf pkg-config pngcrush pngquant python python-all-dev re2c schedtool squashfs-tools subversion texinfo \
    unzip w3m xsltproc zip zlib1g-dev lzip libxml-simple-perl curl

# For all those distro hoppers, lets setup your git credentials
git config --global user.name "x0rzavi"
git config --global user.email "x0rzavi@gmail.com"
git config --global credential.helper "cache --timeout=7200"
git config --global color.ui
echo "git identity setup successfully!"

# From Ubuntu 18.10 onwards and Debian Buster libncurses5 package is not available, so we need to hack our way by symlinking required library
# shellcheck disable=SC2076

if [[ -e /lib/x86_64-linux-gnu/libncurses.so.6 && ! -e /usr/lib/x86_64-linux-gnu/libncurses.so.5 ]]; then
   sudo ln -s /lib/x86_64-linux-gnu/libncurses.so.6 /usr/lib/x86_64-linux-gnu/libncurses.so.5
fi

echo "Installing repo"
sudo curl --create-dirs -L -o /usr/local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
sudo chmod a+rx /usr/local/bin/repo

echo "Setting up done!"
