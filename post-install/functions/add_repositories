#!/bin/bash

# ${1} - Name (for reference)
# ${2} - repo - not including ppa: prefix, example neovim-ppa/stable
function add_ppa {
    # Check if ppa already added
    if ! grep -q "^deb .*${2}" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
        echo_message title "Starting 'add_ppa' function"
        echo_message info "Adding repository for ${1}"
        # sudo add-apt-repository -y ppa:${2}
        add-apt-repository -y ppa:${2}
        echo_message info "Refreshing repository info"
        # sudo apt update
        apt update
        echo_message success "${1} Repository Added"
    else
        echo_message error "${1} Repository already added. Cancelled repository addition"
    fi
}