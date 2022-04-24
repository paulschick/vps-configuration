#!/usr/bin/zsh

#
#   ${1} - Root directory
#       - Docker: /root
#       - Server/Desktop: $HOME
#        - Default: $HOME
#
#
function install_rust {
    ROOT_DIR=${1:-$HOME}
    echo_message title "Running 'install_rust' Function"
    echo_message info "Root directory configured to $ROOT_DIR"
    check_install_apt_package curl
    
    echo_message info "Auto-choosing option 1 for cargo/rust installation"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

    CARGO_PATH=$ROOT_DIR/.cargo/env
    source $CARGO_PATH
    echo_message "Adding cargo source to .zshrc"
    echo ". $CARGO_PATH" >> $ROOT_DIR/.zshrc
}

function install_go {
    echo_message title "Running 'install_go' Function"
}
