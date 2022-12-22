#!/bin/bash

entries=" Power Saver\n Balanced\n龍 Performance"

selected=$(echo -e $entries|wofi --width 250 --height 170 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')
echo $selected
case $selected in
    power)
        powerprofilesctl set power-saver;;
    balanced)
        powerprofilesctl set balanced;;
    performance)
        powerprofilesctl set performance;;
esac