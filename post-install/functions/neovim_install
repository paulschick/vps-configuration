#!/bin/bash

function install_neovim {
    echo_message title "Starting 'install_neovim' function"
    PPA="neovim-ppa/stable"
    echo_message info "Adding PPA $PPA"
    add_ppa Neovim $PPA
    check_install_apt_package neovim
    echo_message success "Successfully installed neovim"
}