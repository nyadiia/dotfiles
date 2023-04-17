#!/bin/env fish
wal -f catppuccin-mocha

killall -SIGUSR2 waybar &
gsettings set org.gnome.desktop.interface gtk-theme Arc-Dark
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
yes | fish_config theme save "Catppuccin Mocha"

# specify the directory to select a random file from
set directory $HOME/Pictures/Wallpapers/dark

# Use shuf to select a random file from the list
set random_file (command ls $directory | shuf -n 1 $files)

# output the name of the randomly selected files
swww img $directory/$random_file
