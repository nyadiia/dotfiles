unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null 

eval "$(starship init zsh)"

export EDITOR="helix"
export VISUAL="helix"

alias ls="exa --icons"
alias l="ls"
alias s="ssh" 
alias cl="clear"
alias wget="wget --hsts-file='$XDG_DATA_HOME/wget-hsts'"
alias yeet="paru -Rcs"
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/yarnrc"
alias sysinfo="macchina"
alias hx="helix"
alias tig="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias conzsh="$EDITOR $ZDOTDIR/.zshrc"
alias conenv="$EDITOR /etc/zsh/zshenv"

source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $ZDOTDIR/plugins/sudo.plugin.zsh
source $ZDOTDIR/plugins/fsh/fast-syntax-highlighting.plugin.zsh

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/nyadiia/.config/zsh/.zshrc'
zmodload zsh/complist

autoload -Uz compinit
compinit
_comp_options+=(globdots) 

HISTFILE=$ZDOTDIR/histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

export PATH=$PATH:/home/nyadiia/.spicetify