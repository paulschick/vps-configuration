# pyenv stuff
# Repo: https://github.com/pyenv/pyenv#automatic-installer
# export PYENV_ROOT="$HOME"/.pyenv
# export PATH="$PYENV_ROOT/bin:$PATH"
# export PATH="$PYENV_ROOT/shims:$PATH"
# if command -v pyenv 1>/dev/null 2>&1;
# then
#     eval "$(pyenv init -)"
# fi

# Oh my zsh installation
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="clean"

# Go
# export GOPATH=$HOME/source/go
# export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Zsh stuff
DISABLE_LS_COLORS="false"
# plugins=(git zsh-syntax-highlighting)
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Aliases
alias c="clear"
alias ~="cd ~"

function pp {
    if [[ $(git remote -v | grep hdd) ]]; then
        git push hdd master
    fi
    if [[ $(git remote -v | grep seagate) ]]; then
        git push seagate master
    fi
    if [[ $(git remote -v | grep pi) ]]; then
        git push pi master
    fi
    if [[ $(git remote -v | grep origin) ]]; then
        git push origin master
    fi
    if [[ $(git remote -v | grep azure) ]]; then
        git push azure master
    fi
}

function commit_count {
    git rev-list --all --count
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
. "$HOME/.cargo/env"

# set to lts node version
nvm use > /dev/null 2>&1

# fpath+=${ZDOTDIR:-~}/.zsh_functions

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
