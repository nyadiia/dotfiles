{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  imports = [
    ./hyprland
    ./btop
    ./shell
    ./git.nix
    ./helix.nix
    ./wezterm.nix
    ./wpaperd.nix
  ];

  home = {
    username = "nyadiia";
    homeDirectory = "/home/nyadiia";
    packages = [
      pkgs.zsh
      pkgs.helix
      pkgs.git
      pkgs.wezterm
      pkgs.wpaperd
      pkgs.btop
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
