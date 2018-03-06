#!/bin/sh

# Fish Setup

rm -rf ~/.config/fish > /dev/null 2>&1
rm -rf ~/.config/fisherman > /dev/null 2>&1

mkdir -p ~/.config/fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

cp config.fish ~/.config/fish/config.fish
cp fishfile ~/.config/fish/fishfile

echo "Start fish and run fisher"
