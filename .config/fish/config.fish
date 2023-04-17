if status is-interactive
    # Commands to run in interactive sessions can go here
end

# gpg ssh agent
if test -z (pgrep ssh-agent)
  eval (ssh-agent -c) > /dev/null
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

starship init fish | source # load prompt
zoxide init fish | source

# updated tools
alias cd 'z'
alias ls 'exa --icons'
## kitty specific
alias icat 'kitty +kitten icat'

# faster usage
alias s 'ssh'
alias l 'ls'
alias ll 'ls -al'
alias la 'ls -a'
alias cl 'clear'
alias hx 'helix'

# alternative paths (cleans up home)
alias wget 'wget --hsts-file=\'$XDG_DATA_HOME/wget-hsts\''
alias yeet 'yay -Rcs'
alias yarn 'yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/yarnrc'

# for dotiles
alias tig 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# user vars
eval $(opam env)
set -x PATH $PATH /home/nyadiia/.spicetify
set -x EDITOR 'nvim'
set -x VISUAL 'nvim'
set -x MANPATH $MANPATH /usr/local/man 

# other vars
source $HOME/.config/fish/conf.d/env.fish
# this is currently broken but it's just a fish thing
# source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
