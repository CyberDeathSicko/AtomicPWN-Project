#!/bin/bash

# Main script content
echo "=== Security Tool ==="
echo "Select an option:"
echo "1. UAC Bypass"
echo "2. Gather Hardware Information"
echo "3. Linux Privilege Escalation"
echo "4. Write to the Hard Drive (for educational purposes)"
echo "5. Exit"

read -p "Enter your choice (1-5): " choice

case $choice in
    1)
        ./lib/uac_bypass.sh
        ;;
    2)
        ./lib/hardware_info.sh
        ;;
    3)
        ./lib/privilege_escalation.sh
        ;;
    4)
        ./lib/hardware_info.sh  # Placeholder for educational purposes
        ;;
    5)
        echo "Exiting. Goodbye!"
        exit 0
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac