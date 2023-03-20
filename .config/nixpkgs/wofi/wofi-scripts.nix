{
  home.file.".config/scripts/wofi-power.sh" = {
    text = ''
      #!/usr/bin/env zsh
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
    '';
    executable = true;
  };
  home.file.".config/scripts/wofi-ppd.sh" = {
    text = ''
      #!/usr/bin/env zsh
      entries=" power Saver\n balanced\n龍 performance"

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
    '';
    executable = true;
  };
}