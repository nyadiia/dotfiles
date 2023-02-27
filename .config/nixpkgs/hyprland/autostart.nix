{
  home.file.".config/hypr/autostart" = {
    text = ''
      #!/usr/bin/env zsh

      sleep 1
      if [[ $__AUTOSTART_RAN -eq 1]]
      then
        killall mako
        killall waybar
        killall wpaperd
        killall fcitx5
      fi
      __AUTOSTART_RAN=1

      mako &
      waybar &
      wpaperd
      fcitx5 -d &
    '';
    executable = true;
  };
}