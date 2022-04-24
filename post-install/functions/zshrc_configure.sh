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
function configure_zshrc {
    echo_message title "Running 'configure_zshrc' Function"
    echo_message warning "This assumes that you have already changed your shell to zsh, and you have oh-my-zsh installed"

    URL="https://raw.githubusercontent.com/paulschick/vps-configuration/master/dotfiles/.zshrc"

    rm ~/.zshrc
    rm ~/.zshrc.*

    wget $URL -P /root/

    source /root/.zshrc
}