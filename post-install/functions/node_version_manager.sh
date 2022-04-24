#!/bin/bash

#
#   ${1} - Root directory
#       - Docker: /root
#       - Server/Desktop: $HOME
#        - Default: $HOME
#
#
function install_node_version_manager {
    ROOT_DIR=${1:-$HOME}

    # Repo https://github.com/nvm-sh/nvm
    echo_message title "Running 'install_node_version_manager' function"
    check_install_apt_package curl
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

    if [ ! -f $ROOT_DIR/.zshrc ]; then
        echo_message warning "No .zshrc file found. Adding node version manager to bashrc"
    else
        echo_message info "Zshrc found, adding node version manager"
        echo 'export NVM_DIR="$HOME/.nvm"' >> $ROOT_DIR/.zshrc
        echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.zshrc
        echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.zshrc

        echo_message info "Node Version Manager added... Zshrc will need to be updated to latest"
    fi

    if [[ $(echo $SHELL) = "/usr/bin/zsh" ]] && [ -f $ROOT_DIR/.zshrc ]; then
        source ~/.zshrc
    else
        source ~/.bashrc
    fi
}

#
#           NOTE
#               Locations will have to be changed. This is for running as root in Docker
#
#   ${1} - Root directory
#       - Docker: /root
#       - Server/Desktop: $HOME
#        - Default: $HOME
#
#
function install_node_lts {
    ROOT_DIR=${1:-$HOME}

    if ! command -v nvm &> /dev/null
    then
        echo_message warning "nvm command not found, attempting to source configuration file"
        if [[ $(echo $SHELL) = "/usr/bin/zsh" ]] && [ -f $ROOT_DIR/.zshrc ]; then
            ACTIVE_CONFIG="$ROOT_DIR/.zshrc"
        else
            ACTIVE_CONFIG="$ROOT_DIR/.bashrc"
        fi

        echo_message info "Active configuration file set to $ACTIVE_CONFIG"

        # run the nvm commands manually to get the command available in session
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    fi

    source $ACTIVE_CONFIG

    nvm install --lts

    source $ACTIVE_CONFIG

    echo $(node --version) >> $ROOT_DIR/.nvmrc
}
