#!/bin/bash

entries="logout 󰍃\nsuspend 󰒲\nreboot \nshutdown 󰐥"

selected=$(echo -e $entries|wofi --width 250 --height 230 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  logout)
    pkill Hyprland;;
  suspend)
    exec systemctl suspend-then-hibernate;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
