#!/bin/bash

function quit {
    echo_message title "Starting 'quit' function"
    exit 99
}

function main {
    echo_message title "Starting 'main' function"
    echo_message error "Docker container testing: sudo is NOT used"

    # update_system
    # echo_message info "Testing check_package_installed with git, nvim"

    # check_install_apt_package git
    # check_install_apt_package neovim

    # echo_message info "Use a dummy function that doesn't install to verify the name of packages"

    # echo_message warning "Sudo isn't used in containers... need to change that back"
    # echo_message welcome "I am installing git to check persistence in the container"
    # apt update && apt install -y git

    update_system # - Required apt update
    # first_installs - Confirmed Working
    install_neovim
    install_node_version_manager
    install_zsh
    install_omz

    quit
}

function import_functions {
    DIR="functions"
    for FUNCTION in $(dirname "$0")/$DIR/*; do
        # skip directories
        if [[ -d $FUNCTION ]]; then
            continue
        # exclude markdown readmes
        elif [[ $FUNCTION == *.md ]]; then
            continue
        # other files, source them
        elif [[ -f $FUNCTION ]]; then
            source $FUNCTION
        fi
    done
}

import_functions
while :
do
    main
done