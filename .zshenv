# Nix
#if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
#    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
#fi
# End Nix
        
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cacheexport 
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XCOMPOSEFILE=$XDG_CONFIG_HOME/X11/xcompose
export NUGET_PACKAGES=$XDG_CACHE_HOME/NuGetPackages

export TERMINAL=wezterm
export TERM=wezterm
export ZSH=$XDG_DATA_HOME/oh-my-zsh
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE=$XDG_STATE_HOME/zsh/history
export PATH=$PATH:$XDG_DATA_HOME/cargo/bin:$HOME/.local/bin

export WLR_DRM_NO_MODIFIERS=1
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export WINEPREFIX="$XDG_DATA_HOME"/wine
export DVDCSS_CACHE="$XDG_DATA_HOME"/dvdcss 
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# Programming Languages
export GOPATH="$XDG_DATA_HOME"/go 
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
# export NIX_PROFILES=/nix/var/nix/profiles/default /home/nyadiia/.nix-profile
# export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
# export NIX_PATH=${NIX_PATH:+$NIX_PATH:}$HOME/.nix-defexpr/channels

# Languages
export GTK_IM_MODULE=fcitx
export QT4_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages

# added by Particle CLI
# add home bin directory to PATH if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
