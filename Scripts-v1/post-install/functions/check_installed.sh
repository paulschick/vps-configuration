#!/bin/bash

# Check for package installation status
function check_package_installed {
    # query dpkg for install status and return a value
	dpkg-query -W --showformat='${Status}\n' $@ | grep "install ok installed" &> /dev/null; echo $?
}

# Check if one package is installed
# ${1} - package
function check_install_apt_package {
    if [ $(check_package_installed ${1}) != 0 ]; then
        echo_message info "Package ${1} is not installed"
        echo_message info "Attempting to install package ${1}"
        # sudo apt install -y ${1}
        apt install -y ${1}
        echo_message info "Finished installation of ${1}"
    else
        echo_message info "Package ${1} is already installed"
    fi
}

