#!/bin/bash

# UAC Bypass script content
echo -e "\nUAC Bypass Completed."

# Function to execute UAC Bypass
execute_uac_bypass() {
    local temp_sudoers_file=$(create_sudoers_file)
    echo -e "\nUAC Bypass Completed."
    cleanup "$temp_sudoers_file"
}

execute_uac_bypass