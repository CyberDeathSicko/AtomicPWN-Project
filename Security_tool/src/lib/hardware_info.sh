#!/bin/bash

declare -A processed_sections

process_section_once() {
    local section_name=$1
    local section_command=$2
    if [ -z "${processed_sections[$section_name]}" ]; then
        echo -e "\n=== $section_name ==="
        eval "$section_command"
        processed_sections[$section_name]=1
    fi
}

# Define a function to prompt for the target IP
get_target_ip() {
    read -p "Enter the target IP address: " target_ip
}

# Section functions
cpu_info() {
    lscpu
}

memory_info() {
    sudo dmidecode -t memory
}

disk_info() {
    lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINT
}

system_uptime() {
    uptime
}

network_interfaces() {
    ip addr show
}

system_temperature() {
    sensors
}

running_processes() {
    ps aux
}

linux_kernel_version() {
    uname -a
}

system_hardware_details() {
    sudo lshw
}

gpu_info() {
    lspci -vnn | grep -iE 'vga|3d'
}

peripheral_devices_usb() {
    lsusb
}

peripheral_devices_pci() {
    lspci -v
}

usb_devices() {
    lsusb -v
}

pci_devices() {
    lspci -vvv
}

mounted_filesystems() {
    df -h
}

open_ports() {
    get_target_ip
    sudo nmap -p- --open "$target_ip" | grep ^[0-9] | cut -d '/' -f 1
}

file_system_information() {
    df -T
}

network_devices() {
    ifconfig -a
}

network_device_eth0_info() {
    ethtool -i eth0
}

dns_configuration() {
    cat /etc/resolv.conf
}

system_services() {
    systemctl list-units --type=service
}

system_users() {
    getent passwd
}

system_groups() {
    getent group
}

installed_packages() {
    dpkg -l
}

kernel_modules() {
    lsmod
}

usb_controllers() {
    lsusb -t
}

file_permissions() {
    sudo find / -type f -exec stat --format='%a %U %G %n' {} \;
}

system_environment_variables() {
    printenv
}

system_firewall_rules() {
    sudo iptables -L
}

system_selinux_status() {
    sestatus
}

system_audit_configuration() {
    sudo auditctl -l
}

system_cron_jobs() {
    crontab -l
}

system_log_files() {
    ls -l /var/log
}

# Prompt for target IP only once
get_target_ip

# Run sections
process_section_once "CPU Info" "cpu_info"
process_section_once "Memory Info" "memory_info"
process_section_once "Disk Info" "disk_info"
process_section_once "System Uptime" "system_uptime"
process_section_once "Network Interfaces" "network_interfaces"
process_section_once "System Temperature" "system_temperature"
process_section_once "Running Processes" "running_processes"
process_section_once "Linux Kernel Version" "linux_kernel_version"
process_section_once "System Hardware Details" "system_hardware_details"
process_section_once "GPU Info" "gpu_info"
process_section_once "Peripheral Devices (USB)" "peripheral_devices_usb"
process_section_once "Peripheral Devices (PCI)" "peripheral_devices_pci"
process_section_once "USB Devices" "usb_devices"
process_section_once "PCI Devices" "pci_devices"
process_section_once "Mounted Filesystems" "mounted_filesystems"
process_section_once "Open Ports" "open_ports"
process_section_once "File System Information" "file_system_information"
process_section_once "Network Devices" "network_devices"
process_section_once "Network Device (eth0) Info" "network_device_eth0_info"
process_section_once "DNS Configuration" "dns_configuration"
process_section_once "System Services" "system_services"
process_section_once "System Users" "system_users"
process_section_once "System Groups" "system_groups"
process_section_once "Installed Packages" "installed_packages"
process_section_once "Kernel Modules" "kernel_modules"
process_section_once "USB Controllers" "usb_controllers"
process_section_once "File Permissions" "file_permissions"
process_section_once "System Environment Variables" "system_environment_variables"
process_section_once "System Firewall Rules" "system_firewall_rules"
process_section_once "System SELinux Status" "system_selinux_status"
process_section_once "System Audit Configuration" "system_audit_configuration"
process_section_once "System Cron Jobs" "system_cron_jobs"
process_section_once "System Log Files" "system_log_files"
