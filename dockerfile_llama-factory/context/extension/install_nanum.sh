#!/bin/bash

# install packages
apt install -y fonts-nanum* fontconfig
fc-cache -fv

# copy fonts to matplotlib package
PACKAGE_PATH=$(python -c 'import site; print(site.getsitepackages()[0])')
cp /usr/share/fonts/truetype/nanum/Nanum* $PACKAGE_PATH/matplotlib/mpl-data/fonts/ttf/

# remove cache
rm -rf ~/.cache/matplotlib/*
