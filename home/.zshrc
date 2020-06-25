# oh-my-zsh setup
export ZSH=/usr/share/oh-my-zsh
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e # Use emacs style shortcuts
set -o emacs

# Setup powerlevel10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Use vim as default editor
export EDITOR='vim'


# Setup some aliases
alias apps="ansible-playbook ~/archible/post-playbook.yml --tags apps"
alias dots="ansible-playbook ~/archible/post-playbook.yml --tags dotfiles"
alias edots="vim ~/archible/post-playbook.yml"
alias a="cd ~/archible"

# Git aliases
alias gdd="git diff --cached"

# Setup gpg-agent
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
# Use either tty shell or GUI
if [[ ! -z "${WAYLAND_DISPLAY}" ]]; then
    export PINENTRY_USER_DATA=USE_TTY=1
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
