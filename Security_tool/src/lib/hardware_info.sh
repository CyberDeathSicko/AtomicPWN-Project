#!/bin/bash

# Declare an associative array to track processed sections
declare -A processed_sections

# Helper function to process a section only once
process_section_once() {
    local section_name=$1
    local section_command=$2
    if [ -z "${processed_sections[$section_name]}" ]; then
        echo -e "\n=== $section_name ==="
        eval "$section_command"
        processed_sections[$section_name]=1
    fi
}

# Process hardware information sections in order of importance

# CPU Info
process_section_once "CPU Info" "lscpu"

# Memory Info
process_section_once "Memory Info" "dmidecode -t memory"

# Disk Info
process_section_once "Disk Info" "lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINT"

# System Uptime
process_section_once "System Uptime" "uptime"

# Network Interfaces
process_section_once "Network Interfaces" "ip addr show"

# System Temperature
process_section_once "System Temperature" "sensors"

# Running Processes
process_section_once "Running Processes" "ps aux"

# Linux Kernel Version
process_section_once "Linux Kernel Version" "uname -a"

# System Hardware Details
process_section_once "System Hardware Details" "lshw"

# Additional hardware information gathering functions

# GPU Info
process_section_once "GPU Info" "lspci -vnn | grep -iE 'vga|3d'"

# Peripheral Devices
process_section_once "Peripheral Devices" "lsusb"
process_section_once "Peripheral Devices" "lspci -v"

# USB Devices
process_section_once "USB Devices" "lsusb -v"

# PCI Devices
process_section_once "PCI Devices" "lspci -vvv"

# Mounted Filesystems
process_section_once "Mounted Filesystems" "df -h"

# Open Ports
process_section_once "Open Ports" "read -p 'Enter the target IP address: ' target_ip && nmap -p- --open \"$target_ip\" | grep ^[0-9] | cut -d '/' -f 1"

# File System Information
process_section_once "File System Information" "df -T"

# Network Devices
process_section_once "Network Devices" "ifconfig -a"
process_section_once "Network Devices" "ethtool -i eth0"  # Replace eth0 with your network interface

# DNS Configuration
process_section_once "DNS Configuration" "cat /etc/resolv.conf"

# System Services
process_section_once "System Services" "systemctl list-units --type=service"

# System Users
process_section_once "System Users" "getent passwd"

# System Groups
process_section_once "System Groups" "getent group"

# Installed Packages
process_section_once "Installed Packages" "dpkg -l"

# Kernel Modules
process_section_once "Kernel Modules" "lsmod"

# USB Controllers
process_section_once "USB Controllers" "lsusb -t"

# File Permissions
process_section_once "File Permissions" "find / -type f -exec stat --format='%a %U %G %n' {} \\;"

# System Environment Variables
process_section_once "System Environment Variables" "printenv"

# System Firewall Rules
process_section_once "System Firewall Rules" "iptables -L"

# System SELinux Status
process_section_once "System SELinux Status" "sestatus"

# System Audit Configuration
process_section_once "System Audit Configuration" "auditctl -l"

# System Cron Jobs
process_section_once "System Cron Jobs" "crontab -l"

# System Log Files
process_section_once "System Log Files" "ls -l /var/log"