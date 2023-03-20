{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Nadia Potteiger";
    userEmail = "nyadiia@pm.me";
    signing = {
      key = "229718FDC160E880";
      signByDefault = true;
    };
    extraConfig = {
      pull.rebase = true;
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
    };
  };
}
