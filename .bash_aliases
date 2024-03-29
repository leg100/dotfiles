alias g='git'
alias gs='git status'
alias gap='git add --patch'
alias gp='git pull'
alias gpu='git push'
alias gd='git diff'
alias gds='git diff --staged'
alias cdg='cd $(git rev-parse --show-toplevel)'
alias ga='git add -A && git commit -m wip && git push -u origin HEAD'
alias gf='git fetch'

[ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git
__git_complete g __git_main

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# push branch and create github PR, with last commit msg as title
alias pr='hub pull-request -o -p -m "$(git log -1 --pretty=format:%B)"'

alias t='terraform'

# golang aliases
alias grm='go run main.go'
