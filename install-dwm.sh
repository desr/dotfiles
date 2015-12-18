#!/bin/sh

# Install dwm
git clone https://github.com/desr/dwm ~/git/dwm
pushd ~/git/dwm
make && sudo make install
popd 

# Install dmenu
git clone https://github.com/desr/dmenu ~/git/dmenu
pushd ~/git/dmenu
make && sudo make install
popd

# Install fonts
git clone https://github.com/powerline/fonts ~/git/fonts
pushd ~/git/fonts
./install.sh
popd
