alias g='git'
alias gs='git status'
alias gap='git add --patch'
alias gp='git pull'
alias gpu='git push'
alias gd='git diff'
alias gds='git diff --staged'

[ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git
__git_complete g __git_main

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# push branch and create github PR, with last commit msg as title
alias pr='hub pull-request -o -p -m "$(git log -1 --pretty=format:%B)"'

alias t='terraform'
