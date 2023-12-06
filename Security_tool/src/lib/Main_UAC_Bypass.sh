#!/bin/bash

create_sudoers_file() {
    local temp_dir=$(mktemp -d)
    local sudoers_file="$temp_dir/uac_bypass"

    echo "$USER ALL=(ALL) NOPASSWD:ALL" > "$sudoers_file"

    sudo install -m 440 -o root -g root "$sudoers_file" "/etc/sudoers.d/uac_bypass"

    echo "$sudoers_file"
}

cleanup() {
    sudo rm -f "/etc/sudoers.d/uac_bypass"
}

# Execute UAC Bypass
execute_uac_bypass() {
    local temp_sudoers_file
    temp_sudoers_file=$(create_sudoers_file)
    echo -e "\nUAC Bypass Completed."
    cleanup
}

# Execute UAC Bypass
execute_uac_bypass
