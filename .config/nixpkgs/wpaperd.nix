{ config, lib, pkgs, ... }:

{
  home.file.".config/wpaperd/output.conf".text = ''
    [default]
    path = "/home/nyadiia/Pictures/Wallpapers/"
    duration = "1h"
  '';
}