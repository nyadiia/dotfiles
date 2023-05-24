if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status is-login
    and status is-interactive
    # To add a key, set -Ua SSH_KEYS_TO_AUTOLOAD keypath
    set -U SSH_KEYS_TO_AUTOLOAD ~/.ssh/id_ed25519
    eval $(opam env) >/dev/null
    # To remove a key, set -U --erase 
    keychain --eval $SSH_KEYS_TO_AUTOLOAD | source
end

set fish_greeting

# gpg ssh agent
# if test -z (pgrep ssh-agent)
#   eval (ssh-agent -c) > /dev/null
#   set -Ux SSH_AGENT_PID $SSH_AGENT_PID
# end
# Ensure that GPG Agent is used as the SSH agent
set -e SSH_AUTH_SOCK
set -U -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -x GPG_TTY (tty)
gpgconf --launch gpg-agent

starship init fish | source # load prompt
zoxide init fish | source

# updated tools
alias cd z
alias ls 'exa --icons'
## kitty specific
alias icat 'kitty +kitten icat'

# faster usage
alias s ssh
alias l ls
alias ll 'ls -al'
alias la 'ls -a'
alias cl clear
alias hx helix

# alternative paths (cleans up home)
alias wget 'wget --hsts-file=\'$XDG_DATA_HOME/wget-hsts\''
alias yeet 'yay -Rcs'
alias yarn 'yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/yarnrc'

# for dotiles
alias tig 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# user vars
set -x PATH $PATH $HOME/.spicetify $HOME/bin
set -x EDITOR nvim
set -x VISUAL nvim
set -x MANPATH $MANPATH /usr/local/man

# other vars
source $HOME/.config/fish/conf.d/env.fish
# this is currently broken but it's just a fish thing
# source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
