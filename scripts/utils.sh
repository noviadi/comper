#!/bin/bash

# Export all functions for use in child scripts
set -a

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

# Get version from package.json
get_version() {
    local project_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
    if command -v node >/dev/null 2>&1; then
        echo $(node -p "require('$project_root/package.json').version")
    else
        # Fallback using grep and sed if node is not available
        grep '"version":' "$project_root/package.json" | sed 's/.*: "\(.*\)".*/\1/'
    fi
}

# Restore default behavior
set +a
