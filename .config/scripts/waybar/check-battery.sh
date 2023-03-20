#!/usr/bin/env zsh

bat=/sys/class/power_supply/BAT1
CRIT=15

FILE=~/.config/scripts/waybar/notified

stat=$(cat $bat/status)
perc=$(cat $bat/capacity)

if [[ $perc -le $CRIT ]] && [[ $stat == "Discharging" ]]; then
  if [[ ! -f "$FILE" ]]; then
    notify-send --urgency=critical --icon=dialog-warning "Battery Low" "Current charge: $perc%"
    touch $FILE
  fi
elif [[ -f "$FILE" ]]; then
  rm $FILE
fi
