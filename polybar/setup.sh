#!/bin/sh

rm -rf ~/.config/polybar/config > /dev/null 2>&1
rm -rf ~/.config/polybar/master.conf > /dev/null 2>&1
rm -rf ~/.config/polybar/custom.conf > /dev/null 2>&1

mkdir -p ~/.config/polybar

ln -sf $(readlink -f config) ~/.config/polybar/config
ln -sf $(readlink -f master.conf) ~/.config/polybar/master.conf
ln -sf $(readlink -f custom.conf) ~/.config/polybar/custom.conf

polybar -r top &
polybar -r bottom &

echo
echo "Make sure to load the 'top' and 'bottom' bar with polybar"
echo
