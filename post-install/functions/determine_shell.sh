#!/bin/bash

#
#   --------------------------------------------------------------------------------------------------------------
#   --------------------------------------------------------------------------------------------------------------
#
#   Determines the user's active shell                                                  --------------------------
#   Currrently only supporting zsh and bash                                             --------------------------
#
#   Source is go install script:                                                        --------------------------
#   https://github.com/canha/golang-tools-install-script/blob/master/goinstall.sh       --------------------------
#
#   --------------------------------------------------------------------------------------------------------------
#   --------------------------------------------------------------------------------------------------------------
#   --------------------------------------------------------------------------------------------------------------
#   --------------------------------------------------------------------------------------------------------------
#
#   Usage: CONF=$(shell_config_name)
#           $HOME/$CONF - to get the configuration file to target
#
#       NOTE -> $SHELL must have output
#           This causes problems testing in Docker
function shell_config_name {
    if [ -n "$($SHELL -c 'echo $ZSH_VERSION')" ]; then
        conf=".zshrc"
    elif [ -n "$($SHELL -c 'echo $BASH_VERSION')" ]; then
        conf=".bashrc"
    fi
    echo $conf
}