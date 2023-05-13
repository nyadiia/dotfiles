#!/usr/bin/env fish
set -l entries "󱤅 power saver"\n"󰾞 balanced"\n"󰈸 performance"

set -l selected (echo $entries | anyrun -o libstdin.so | awk '{print tolower($2)}')
echo $selected

switch $selected
    case "power"
        powerprofilesctl set power-saver
    case "balanced"
        powerprofilesctl set balanced
    case "performance"
        powerprofilesctl set performance
end