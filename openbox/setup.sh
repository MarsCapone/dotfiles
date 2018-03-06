#!/bin/sh

rm -rf ~/.config/openbox/rc.xml > /dev/null 2>&1

mkdir -p ~/.config/openbox

ln -sf $(readlink -f rc.xml) ~/.config/openbox/rc.xml
ln -sf $(readlink -f loaded.xml) ~/.config/openbox/loaded.xml

mkdir ~/bin
find bin/ -type f -exec ln -sf $(readlink -f {}) ~/bin/ \;
