# !/bin/bash

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


    if [ -f "$ROOT_DIR"/.zshrc ]; then
        CONF_FILE=".zshrc"
    else
        CONF_FILE=".bashrc"
    fi
    echo_message "Adding cargo source to $CONF_FILE"
    echo ". $CARGO_PATH" >> $ROOT_DIR/$CONF_FILE
}

#
#   ${1} - Root directory
#       - Docker: /root
#       - Server/Desktop: $HOME
#        - Default: $HOME
#
#   ${2} - Gopath
#       Defaults to $ROOT_DIR/go
#
#   ${3} - Go version
#       Example: 1.18.1
#       would be entered as 1.18.1 and converted to go1.18.1.linux-amd64.tar.gz by the function
#
# 
function install_go {
    ROOT_DIR=${1:-$HOME}
    GO_BASE=${2:-$ROOT_DIR}
    GO_V=${3:-1.18.1}
    echo_message title "Running 'install_go' Function"

    if [ -f "$ROOT_DIR"/.zshrc ]; then
        CONF_FILE=".zshrc"
    else
        CONF_FILE=".bashrc"
    fi

    echo_message info "Configuration file set to $CONF_FILE"
    SHELL_PROFILE=$ROOT_DIR/$CONF_FILE
    echo_message info "Writing changes to $SHELL_PROFILE"

    [ -z "$GOPATH" ] && GOPATH="$GO_BASE/go"
    echo_message info "GOPATH set to $GOPATH"

    TEMP_DIR=$(mktemp -d)
    PACKAGE_NAME="go$GO_V.linux-amd64.tar.gz"
    #URL="https://go.dev/dl/$PACKAGE_NAME"
    URL="https://storage.googleapis.com/golang/$PACKAGE_NAME"

    echo_message info "Downloading $PACKAGE_NAME"

    check_install_apt_package curl
    curl -o "$TEMP_DIR/go.tar.gz" $URL

    if [ $? -ne 0 ]; then
        echo_message error "Download failed! Exiting."
        exit 1
    fi

    echo_message success "Download succeeded"
    echo_message info "Extracting file"
    tar -c /usr/local -xzf "$TEMP_DIR/go.tar.gz"

    echo_message info "Configuring $SHELL_PROFILE for Go"

    {
        echo '# GoLang'
        echo "export GOPATH=$GOPATH"
        echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin'
    } >> $SHELL_PROFILE

    mkdir -p "${GOPATH}/"{src,pkg,bin}
    echo_message info "Go installation complete"
    rm -rf "$TEMP_DIR/go.tar.gz"
}
