#!/bin/sh

rm -rf ~/.config/terminator > /dev/null 2>&1
mkdir -p ~/.config/terminator

ln -sf $(readlink -f config) ~/.config/terminator/config
