# Created by newuser for 5.9.1

autoload -Uz compinit
compinit

source <(fzf --zsh)

eval "$(starship init zsh)"


typeset -U path PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:/home/mavgone/.spicetify
