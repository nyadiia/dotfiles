{ config, pkgs, ... }:

{
  imports = [ ./theme.nix ];
  programs.btop = {
    enable = true;
    settings = {
      theme = "${config.home.homeDirectory}/.config/btop/themes/catppuccin_mocha.theme";
      theme_background = false;
      rounded_corners = true;
      show_battery = false;
    };
  };
}