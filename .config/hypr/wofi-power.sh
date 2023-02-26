#!/bin/bash

entries="󰍃 logout\n󰒲 suspend\n󰋊 hibernate\n reboot\n󰐥 shutdown\n"

selected=$(echo -e $entries|wofi --width 250 --height 230 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  logout)
    pkill Hyprland;;
  suspend)
    exec systemctl suspend-then-hibernate;;
  hibernate)
    exec systemctl hibernate;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
