#!/bin/bash

#
#   ${1} - Name for `git config --global user.name`
#   ${2} - Email for `git config --global user.email`
#
function first_installs {
    GIT_NAME=${1:-paulschick}
    GIT_EMAIL=${2:-paul@pschick.com}

    # check_install_apt_package
    check_install_apt_package curl
    check_install_apt_package wget
    check_install_apt_package git
    echo_message info "Setting git name to $GIT_NAME" 
    git config --global user.name $GIT_NAME
    echo_message info "Setting git email to $GIT_EMAIL"
    git config --global user.email $GIT_EMAIL
    echo_message success "Successfully installed and configured git"
    check_install_apt_package build-essential
    check_install_apt_package make
    check_install_apt_package python3-dev
    check_install_apt_package python3-pip
    check_install_apt_package python3-venv
    check_install_apt_package checkinstall
    check_install_apt_package sqlite3
    check_install_apt_package zsh
    check_install_apt_package net-tools
    # Install default Java jre
    check_install_apt_package default-jre
    
    # this is for TreeSitter-nvim
    check_install_apt_package g++

    check_install_apt_package vim
}
