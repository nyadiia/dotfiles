#!/usr/bin/env fish
set -l entries "󰍃 logout"\n"󰒲 suspend"\n"󰋊 hibernate"\n" reboot"\n"󰐥 shutdown"

set -l selected (echo $entries | anyrun -o libstdin.so | awk '{print tolower($2)}')
echo $selected

switch $selected
    case "logout"
        pkill Hyprland
    case "suspend"
        systemctl suspend-then-hibernate
    case "hibernate"
        systemctl hibernate
    case "reboot"
        systemctl reboot
    case "shutdown"
        systemctl poweroff
end