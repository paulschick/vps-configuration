#!/usr/bin/zsh

function set_default_shell {
    ZSH=$(which zsh)
    chsh $ZSH
}

#
#   ${1} - Root directory
#       - Docker: /root
#       - Server/Desktop: $HOME
#        - Default: $HOME
#
#
function configure_zshrc {
    ROOT_DIR=${1:-$HOME}

    echo_message title "Running 'configure_zshrc' Function"
    echo_message warning "This assumes that you have already changed your shell to zsh, and you have oh-my-zsh installed"

    URL="https://raw.githubusercontent.com/paulschick/vps-configuration/master/dotfiles/.zshrc"

    rm $ROOT_DIR/.zshrc
    rm $ROOT_DIR/.zshrc.*

    wget $URL -P $ROOT_DIR/

    source $ROOT_DIR/.zshrc
}