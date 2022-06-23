# declare PATH afresh each time to avoid repeating PATHs
PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then PATH="$HOME/.local/bin:$PATH"; fi

# set PATH so it includes go bin if it exists
if [ -d "/usr/local/go/bin" ]; then PATH="/usr/local/go/bin:$PATH"; fi

# set PATH so it includes go bin if it exists
if [ -d "$HOME/go/bin" ]; then PATH="$HOME/go/bin:$PATH"; fi

# pyenv - pyenv init manipulates PATH too
if [ -d "$PYENV_ROOT" ]; then
    PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
fi

# github 'hub' cli program
if [ -d "/usr/local/hub" ]; then PATH="/usr/local/hub/bin:$PATH"; fi

# updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/google-cloud-sdk/path.bash.inc"; fi

if [ -d "/usr/local/lib/nodejs" ]; then
    NODE_VERSION="v16.14.2"
    PATH="/usr/local/lib/nodejs/node-${NODE_VERSION}-linux-x64/bin:$PATH"
fi

# kubebuilder
if [ -d "/usr/local/kubebuilder" ]; then PATH="/usr/local/kubebuilder/bin:$PATH"; fi
