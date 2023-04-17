# clean up home and set -x XDG vars
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state
set -x XDG_CACHE_HOME $HOME/.cacheexport 
set -x XAUTHORITY $XDG_RUNTIME_DIR/Xauthority
set -x XCOMPOSEFILE $XDG_CONFIG_HOME/X11/xcompose
set -x NUGET_PACKAGES $XDG_CACHE_HOME/NuGetPackages

# env vars
set -x TERMINAL kitty
set -x TERM kitty
set -x PATH $PATH $XDG_DATA_HOME/cargo/bin $HOME/.local/bin

set -x WLR_DRM_NO_MODIFIERS 1
set -x GNUPGHOME $XDG_DATA_HOME/gnupg
set -x WINEPREFIX $XDG_DATA_HOME/wine
set -x DVDCSS_CACHE $XDG_DATA_HOME/dvdcss 
set -x GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc

# Programming Languages
set -x GOPATH $XDG_DATA_HOME/go 
set -x CARGO_HOME $XDG_DATA_HOME/cargo
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
set -x PYTHONSTARTUP $XDG_CONFIG_HOME/python/pythonrc
# set -x NIX_PROFILES /nix/var/nix/profiles/default /home/nyadiia/.nix-profile
# set -x NIX_SSL_CERT_FILE /etc/ssl/certs/ca-certificates.crt
# set -x NIX_PATH ${NIX_PATH:+$NIX_PATH:}$HOME/.nix-defexpr/channels

# Languages
set -x GTK_IM_MODULE fcitx
set -x QT4_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS @im=fcitx
set -x _JAVA_OPTIONS -Djava.util.prefs.userRoot=\"$XDG_CONFIG_HOME\"/java
set -x NUGET_PACKAGES \"$XDG_CACHE_HOME\"/NuGetPackages
