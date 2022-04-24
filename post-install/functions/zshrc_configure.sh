#!/usr/bin/zsh

#
#       MUST
#            Do a check to make sure /usr/bin/zsh
#
#
#       NOTE
#           Make sure to change routes for a server NOT running root.
#           And add sudo in..
#
#
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