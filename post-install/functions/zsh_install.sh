#!/bin/bash

function install_zsh {
    echo_message title "Running 'install_zsh' Function"
    check_install_apt_package zsh
}

function install_omz {
    echo_message title "Running 'install_omz' Function"
    echo_message error "This is an interactive installation. Zsh should be default shell"
    check_install_apt_package git
    check_install_apt_package curl
    check_install_apt_package zsh
    # sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
    # Trying to say "Yes" automatically
    yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}