# dotfiles

Repository for my dotfiles, following the [bare repo](https://www.atlassian.com/git/tutorials/dotfiles) approach.

Usage:

```bash
# change into home directory
cd

# clone into a bare repo
git clone --bare git@github.com:leg100/dotfiles.git .dotfiles

# set alias in current shell (`dotfiles` henceforth used in place of `git`)
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# checkout repo contents into home dir (warning: -f overwrites existing files)
dotfiles checkout -f

# don't show (masses of) untracked files
dotfiles config --local status.showUntrackedFiles no

# done (remember to re-login to activate shell dotfiles such as .bashrc)
```
