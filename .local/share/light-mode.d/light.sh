#!/bin/env fish
wal -f catppuccin-latte -l
killall -SIGUSR2 waybar &
gsettings set org.gnome.desktop.interface gtk-theme Arc-Lighter
gsettings set org.gnome.desktop.interface color-scheme default
yes | fish_config theme save "Catppuccin Latte"

# specify the directory to select a random file from
set directory $HOME/Pictures/Wallpapers/light

# Use shuf to select a random file from the list
set random_file (command ls $directory | shuf -n 1)

# output the name of the randomly selected files
swww img $directory/$random_file
