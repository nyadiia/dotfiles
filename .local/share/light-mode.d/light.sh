#!/bin/env zsh
wal -f catppuccin-latte -l
./light_wallpaper.sh
killall -SIGUSR2 waybar &
gsettings set org.gnome.desktop.interface gtk-theme Arc-Lighter
gsettings set org.gnome.desktop.interface color-scheme default
