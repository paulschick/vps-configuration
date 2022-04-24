#!/usr/bin/zsh

#
#
#       May need to set #!/usr/bin/zsh
#
#
#
#
function quit {
    echo_message title "Starting 'quit' function"
    exit 99
}

function main {
    echo_message title "Starting 'main' function"

    echo_message info "This should be run after the initial configuration is completed, and you have configured things that require interaction."
    echo_message question "An example would be to have zsh configured as the default"
    echo_message info "This script will configure the .zshrc file, as well as others"

    configure_zshrc
    configure_nvim

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
