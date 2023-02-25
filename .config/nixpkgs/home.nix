{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  imports = [
    ./zsh.nix
    ./git.nix
    ./starship.nix
    ./hyprland.nix
    ./helix.nix
  ];

  home = {
    username = "nyadiia";
    homeDirectory = "/home/nyadiia";
    packages = [
      pkgs.zsh
      pkgs.helix
    ];
    stateVersion = "22.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
