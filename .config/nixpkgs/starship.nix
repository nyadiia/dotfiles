{ config, lib, pkgs, ... }:

{
  programs.starship = {
    enable = true;
      settings = {
      add_newline = true;

      character = {
        success_symbol = "[❯](#FF0066)";
        error_symbol = "[✗](#ff4879)";
        vimcmd_symbol = "[❮](bold green)";
        vimcmd_replace_one_symbol = "[❮](bold purple)";
        vimcmd_replace_symbol = "[❮](bold purple)";
        vimcmd_visual_symbol = "[❮](bold yellow)";
      };

      username = {
        show_always = true;
        style_user = "#FF0066";
        style_root = "#A00CE8";
      };
      
      # package.disabled = true;
    };
  };
}