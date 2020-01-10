alias g='git'

[ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git
__git_complete g __git_main

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
