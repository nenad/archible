# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nenad/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
#
set -o emacs
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

export EDITOR='vim'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias apps="ansible-playbook ~/archible/post-playbook.yml --tags apps"
alias dots="ansible-playbook ~/archible/post-playbook.yml --tags dotfiles"
alias edots="vim ~/archible/post-playbook.yml"

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
