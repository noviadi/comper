#!/bin/bash

# Get the absolute path of the project directory
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source utility functions
source "$PROJECT_DIR/scripts/utils.sh"

# Detect OS more reliably by checking for PowerShell
detect_os() {
    if command -v powershell.exe >/dev/null 2>&1; then
        echo "windows"
    else
        echo "unix"
    fi
}

OS=$(detect_os)

# Create comper symlink or cmd file based on OS
if [ "$OS" = "windows" ]; then
    # Windows setup
    echo "Setting up for Windows..."
    
    # Create comper.cmd for Windows
    echo "@echo off" > comper.cmd
    echo "bash ./comper %*" >> comper.cmd
    
    # Set permissions using icacls
    powershell.exe -Command "icacls comper /grant Everyone:RX"
    powershell.exe -Command "icacls comper.cmd /grant Everyone:RX"
    
    echo "Created comper.cmd for Windows"
else
    # Unix setup
    chmod +x comper scripts/run.sh scripts/create.sh
    echo "Set executable permissions for Unix"
fi

# Install JavaScript dependencies
echo "Installing JavaScript dependencies..."
run_os_command \
    'powershell.exe -Command "npm install"' \
    'npm install'

# Make all shell scripts executable
chmod +x "$PROJECT_DIR/scripts/create.sh"
chmod +x "$PROJECT_DIR/scripts/run.sh"

# Function to add to PATH in different shell config files
setup_shell_config() {
    local shell_rc="$1"
    local shell_name="$2"
    
    # Check if the config file exists
    if [ -f "$shell_rc" ]; then
        # Check if PATH already contains our directory
        if ! grep -q "# comper PATH" "$shell_rc"; then
            echo "" >> "$shell_rc"
            echo "# comper PATH" >> "$shell_rc"
            echo "export PATH=\"\$PATH:$PROJECT_DIR\"" >> "$shell_rc"
            echo "Added comper to $shell_name PATH in $shell_rc"
        else
            echo "$shell_name PATH already configured in $shell_rc"
        fi
    fi
}

# Setup for bash
setup_shell_config "$HOME/.bashrc" "bash"
setup_shell_config "$HOME/.bash_profile" "bash"

# Setup for zsh
setup_shell_config "$HOME/.zshrc" "zsh"

# Setup for fish
FISH_CONFIG="$HOME/.config/fish/config.fish"
if [ -f "$FISH_CONFIG" ]; then
    if ! grep -q "# comper PATH" "$FISH_CONFIG"; then
        echo "" >> "$FISH_CONFIG"
        echo "# comper PATH" >> "$FISH_CONFIG"
        echo "set -gx PATH \$PATH $PROJECT_DIR" >> "$FISH_CONFIG"
        echo "Added comper to fish PATH in $FISH_CONFIG"
    else
        echo "fish PATH already configured in $FISH_CONFIG"
    fi
fi

# For Windows PowerShell
POWERSHELL_PROFILE="$HOME/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"
if [ -f "$POWERSHELL_PROFILE" ]; then
    if ! grep -q "# comper PATH" "$POWERSHELL_PROFILE"; then
        echo "" >> "$POWERSHELL_PROFILE"
        echo "# comper PATH" >> "$POWERSHELL_PROFILE"
        echo "\$env:Path += \";$PROJECT_DIR\"" >> "$POWERSHELL_PROFILE"
        echo "Added comper to PowerShell PATH in $POWERSHELL_PROFILE"
    else
        echo "PowerShell PATH already configured in $POWERSHELL_PROFILE"
    fi
fi

# Create PowerShell profile if it doesn't exist
if [ ! -f "$POWERSHELL_PROFILE" ]; then
    mkdir -p "$(dirname "$POWERSHELL_PROFILE")"
    echo "# PowerShell Profile" > "$POWERSHELL_PROFILE"
    echo "" >> "$POWERSHELL_PROFILE"
    echo "# comper PATH" >> "$POWERSHELL_PROFILE"
    echo "\$env:Path += \";$PROJECT_DIR\"" >> "$POWERSHELL_PROFILE"
    echo "Created PowerShell profile and added comper to PATH"
fi

# For Windows System PATH (requires admin privileges)
echo "Note: To add comper to Windows System PATH permanently:"
echo "1. Open System Properties (Win + Pause/Break)"
echo "2. Click on 'Advanced system settings'"
echo "3. Click on 'Environment Variables'"
echo "4. Under 'System variables', find and select 'Path'"
echo "5. Click 'Edit' and add this directory: $PROJECT_DIR"

echo ""
echo "Setup complete! Please restart your terminal or run:"
echo "  bash/zsh: source ~/.bashrc or ~/.zshrc"
echo "  fish:     source ~/.config/fish/config.fish"
echo "  PowerShell: . \$PROFILE"
echo ""
echo "You can now use comper from anywhere:"
echo "1. Create a new problem:   comper create <problem_name> [language]"
echo "2. Run tests:              comper run [problem_name] [language]"
echo "3. Show help:              comper --help"
