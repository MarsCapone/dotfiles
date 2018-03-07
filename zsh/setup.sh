#!/bin/sh

# Setup script for zsh

# remove old stuff
rm -rf ~/.zshrc   > /dev/null 2>&1
rm -rf ~/.zsh     > /dev/null 2>&1
rm -rf ~/.zsh-dircolors.config > /dev/null 2>&1
rm -rf ~/.config/zgen > /dev/null 2>&1

# prepare
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.config/zgen"

# make links
ln -sf $(readlink -f zshrc) ~/.zshrc
