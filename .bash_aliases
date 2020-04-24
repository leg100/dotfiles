alias g='git'

[ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git
__git_complete g __git_main

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# push branch and create github PR, with last commit msg as title
alias pr='hub pull-request -o -p -m "$(git log -1 --pretty=format:%B)"'
