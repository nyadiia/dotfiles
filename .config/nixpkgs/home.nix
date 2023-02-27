{ config, pkgs, ... }:
let
  python-packages = p: with p; [
    requests
    # other python packages
  ];
in {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  imports = [
    ./hyprland
    ./btop
    ./shell
    ./wofi
    ./git.nix
    ./helix.nix
    ./wezterm.nix
    ./wpaperd.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

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
      (pkgs.python3.withPackages python-packages)
      (pkgs.discord.override { withOpenASAR = true; })
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
