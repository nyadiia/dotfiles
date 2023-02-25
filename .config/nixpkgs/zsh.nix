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

  programs.zsh = {
    enable = true;

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

      plugins = [
        "command-not-found"
        "git"
        "history"
        "sudo"
        "fzf"
      ];
    };
    initExtra = ''
      source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
      source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    '';
  };
}
