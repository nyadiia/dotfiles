#!/bin/env zsh

# specify the directory to select a random file from
directory="$HOME/Pictures/Wallpapers/light/"

# use the `ls` command to list all files in the directory, and pipe the output to the `shuf` command to randomize the order
# the `-n 1` flag tells `shuf` to only output one random line
random_file=$(ls "$directory" | shuf -n 1)

# output the name of the randomly selected files
output="${directory}${random_file}"
swww img $output
