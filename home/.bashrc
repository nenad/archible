# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
alias apps="ansible-playbook -K ~/archible/post-playbook.yml --tags apps"
alias dots="ansible-playbook ~/archible/post-playbook.yml --tags dotfiles"
