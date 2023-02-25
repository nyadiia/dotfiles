{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Nadia";
    userEmail = "nyadiia@pm.me";
    
    signing = {
      key = "229718FDC160E880";
      signByDefault = true;
    };
  };
}