#!/usr/bin/env zsh
# script to show current power profile

current_profile=$(powerprofilesctl get)

case $current_profile in
  power-saver)
    echo "󱤅"
    ;;
  balanced)
    echo "󰾞"
    ;;
  performance)
    echo "󰈸"
    ;;
  *)
    echo "✗"
    ;;
esac
