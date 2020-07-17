# oh-my-zsh setup
export ZSH=/usr/share/oh-my-zsh
plugins=(git kubectl)
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

# Add paths
export PATH=$HOME/Apps:$HOME/.local/bin:$PATH

# Setup some aliases
alias apps="ansible-playbook ~/archible/post-playbook.yml --tags apps"
alias dots="ansible-playbook ~/archible/post-playbook.yml --tags dotfiles"
alias edots="vim ~/archible/post-playbook.yml"
alias a="cd ~/archible"
alias aa="ansible-playbook ~/archible/post-playbook.yml --tags"

# Git aliases
alias gdd="git diff --cached"

if [ -f $HOME/.workrc ]; then
	source $HOME/.workrc
fi
