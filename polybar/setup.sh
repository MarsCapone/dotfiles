#!/bin/sh

rm -rf ~/.config/polybar/config > /dev/null 2>&1
rm -rf ~/.config/polybar/master.conf > /dev/null 2>&1
rm -rf ~/.config/polybar/custom.conf > /dev/null 2>&1

rm -rf ~/.config/networkmanager_demu/config.ini > /dev/null 2>&1

sudo rm $(which networkmanager_dmenu)

mkdir -p ~/.config/polybar
mkdir -p ~/.config/networkmanager_dmenu


ln -sf $(readlink -f config) ~/.config/polybar/config
ln -sf $(readlink -f master.conf) ~/.config/polybar/master.conf
ln -sf $(readlink -f custom.conf) ~/.config/polybar/custom.conf

ln -sf $(readlink -f networkmanager_dmenu-config.ini) ~/.config/networkmanager_dmenu/config.ini
sudo ln -sf $(readlink -f networkmanager_dmenu) /usr/sbin/networkmanager_dmenu

polybar -r top &
polybar -r bottom &

echo
echo "Make sure to load the 'top' and 'bottom' bar with polybar"
echo
