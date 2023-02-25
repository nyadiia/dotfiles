{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    completionInit = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    dotDir = ".config/zsh";
    shellAliases = {
      ls = "exa --icons";
      ll = "ls -l";
      la = "ls -al";
      s = "ssh";
      cl = "clear";
      wget = "wget --hsts-file='$XDG_DATA_HOME/wget-hsts'";
      yeet = "yay -Rcs";
      yarn = "yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/yarnrc";
      sysinfo = "macchina";
      hx = "helix";
      tig = "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME";
    };
    history = {
      size = 10000;
      path = "$HOME/.config/zsh/histfile";
    };
    oh-my-zsh = {
      enable = true;

      plugins = [ "command-not-found" "git" "history" "sudo" "fzf" ];
    };
    initExtra = ''
      source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
      source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    '';
    envExtra = ''
      export XDG_CONFIG_HOME=$HOME/.config
      export XDG_DATA_HOME=$HOME/.local/share
      export XDG_STATE_HOME=$HOME/.local/state
      export XDG_CACHE_HOME=$HOME/.cacheexport
      export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
      export XCOMPOSEFILE=$XDG_CONFIG_HOME/X11/xcompose
      export NUGET_PACKAGES=$XDG_CACHE_HOME/NuGetPackages

      export TERMINAL=wezterm
      export TERM=wezterm
      export PATH=$PATH:$XDG_DATA_HOME/cargo/bin:$HOME/.local/bin

      export WLR_DRM_NO_MODIFIERS=1
      export GNUPGHOME="$XDG_DATA_HOME"/gnupg
      export WINEPREFIX="$XDG_DATA_HOME"/wine
      export DVDCSS_CACHE="$XDG_DATA_HOME"/dvdcss
      export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

      # Wayland Fuckery
      export QT_QPA_PLATFORM="wayland"
      export QT_QPA_PLATFORMTHEME=qt5ct  # Needed for some applications on some compositors
      export CLUTTER_BACKEND=wayland
      export SDL_VIDEODRIVER=wayland
      export MOZ_ENABLE_WAYLAND=1
      export XDG_CURRENT_DESKTOP=Hyprland
      export XDG_SESSION_TYPE=wayland
      export XDG_SESSION_DESKTOP=Hyprland

      # Programming Languages
      export GOPATH="$XDG_DATA_HOME"/go
      export CARGO_HOME="$XDG_DATA_HOME"/cargo
      export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
      export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"

      # Languages
      export GTK_IM_MODULE=fcitx
      export QT_IM_MODULE=fcitx
      export XMODIFIERS=@im=fcitx
      export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
      export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
    '';
  };
}
