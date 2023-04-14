#!/bin/env zsh
wal -f catppuccin-mocha
./dark_wallpaper.sh
killall -SIGUSR2 waybar &
gsettings set org.gnome.desktop.interface gtk-theme Arc-Dark
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
