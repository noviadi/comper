#!/bin/bash

# Detect OS by checking for PowerShell
detect_os() {
    if command -v powershell.exe >/dev/null 2>&1; then
        echo "windows"
    else
        echo "unix"
    fi
}

# Run a command based on OS
# Usage: run_os_command "windows_command" "unix_command"
run_os_command() {
    local windows_cmd="$1"
    local unix_cmd="$2"
    
    if [ "$(detect_os)" = "windows" ]; then
        eval "$windows_cmd"
    else
        eval "$unix_cmd"
    fi
}
