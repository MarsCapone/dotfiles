#!/bin/sh

# Setup script for nvim

# ditch old file
rm -rf ~/.config/nvim/init.vim > /dev/null 2>&1

#symlink the new one
ln -sf $(readlink -f init.vim) ~/.config/nvim/init.vim

# get vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim/plugged

# install plugins
nvim -c PlugInstall -c qa
