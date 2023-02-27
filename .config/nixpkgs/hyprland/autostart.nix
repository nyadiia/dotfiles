{
  home.file.".config/hypr/autostart" = {
    text = ''
      #!/usr/bin/env zsh

      sleep 1
      killall mako
      killall waybar
      killall wpaperd
      killall fcitx5

      mako &
      waybar &
      wpaperd
      fcitx5 -d &
    '';
    executable = true;
  };
}