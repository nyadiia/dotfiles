# clean up home and set -gx XDG vars
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/.cacheexport 
set -gx XAUTHORITY $XDG_RUNTIME_DIR/Xauthority
set -gx XCOMPOSEFILE $XDG_CONFIG_HOME/X11/xcompose
set -gx NUGET_PACKAGES $XDG_CACHE_HOME/NuGetPackages

# env vars
set -gx TERMINAL kitty
set -gx TERM kitty
set -gx PATH $PATH $XDG_DATA_HOME/cargo/bin $HOME/.local/bin

set -gx WLR_DRM_NO_MODIFIERS 1
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg
set -gx WINEPREFIX $XDG_DATA_HOME/wine
set -gx DVDCSS_CACHE $XDG_DATA_HOME/dvdcss 
set -gx GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc

# Programming Languages
set -gx GOPATH $XDG_DATA_HOME/go 
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
set -gx PYTHONSTARTUP $XDG_CONFIG_HOME/python/pythonrc
# set -gx NIX_PROFILES /nix/var/nix/profiles/default /home/nyadiia/.nix-profile
# set -gx NIX_SSL_CERT_FILE /etc/ssl/certs/ca-certificates.crt
# set -gx NIX_PATH ${NIX_PATH:+$NIX_PATH:}$HOME/.nix-defexpr/channels
set -gx LOCALE_ARCHIVE /usr/lib/locale/locale-archive

# Languages
set -gx GTK_IM_MODULE fcitx
set -gx QT4_IM_MODULE fcitx
set -gx QT_IM_MODULE fcitx
set -gx XMODIFIERS @im=fcitx
set -gx _JAVA_OPTIONS -Djava.util.prefs.userRoot=\"$XDG_CONFIG_HOME\"/java
set -gx NUGET_PACKAGES \"$XDG_CACHE_HOME\"/NuGetPackages

