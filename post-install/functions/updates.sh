#!/bin/bash

function update_system {
    echo_message title 'Performing system update'
    # sudo apt update && sudo apt full-upgrade -y
    apt update && apt full-upgrade -y
}
