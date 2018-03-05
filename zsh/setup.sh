#!/bin/sh

# Setup script for zsh

# remove old stuff
rm -rf ~/.zshrc   > /dev/null 2>&1
rm -rf ~/.zsh     > /dev/null 2>&1
rm -rf ~/.zsh-dircolors.config > /dev/null 2>&1

# prepare
mkdir -p ~/.zsh
curl -sL git.io/antibody | bash -s

# make links
ln -sf $(readlink -f zshrc) ~/.zshrc
antibody bundle < plugins.txt > ~/.zsh/plugins.sh
