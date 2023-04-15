# gpg ssh setup
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null 

# prompt
eval "$(starship init zsh)"

# kitty specific
alias icat="kitty +kitten icat"

# faster usage
alias s="ssh"
alias ls="exa --icons"
alias l="ls"
alias ll="ls -al"
alias la="ls -a"
alias cl="clear"
alias hx="helix"

# alternative paths (clean up home)
alias wget="wget --hsts-file='$XDG_DATA_HOME/wget-hsts'"
alias yeet="yay -Rcs"
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/yarnrc"
alias tig="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# plugins
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source $ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# source $ZDOTDIR/plugins/sudo.plugin.zsh
source $ZDOTDIR/plugins/fsh/fast-syntax-highlighting.plugin.zsh
source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

# completions
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/nyadiia/.config/zsh/.zshrc'
zmodload zsh/complist
autoload -Uz compinit
compinit
_comp_options+=(globdots) 

# history file stuff
HISTFILE=$ZDOTDIR/histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

# sane key bindings aka what text editors have by default
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# user vars
export PATH=$PATH:/home/nyadiia/.spicetify
eval $(opam env)

# added by Particle CLI
# add home bin directory to PATH if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export EDITOR="nvim"
export VISUAL="nvim"
