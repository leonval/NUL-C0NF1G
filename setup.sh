#!/bin/bash

# Function to display an error message and exit
function error_exit {
    echo "❌ Error: $1" >&2
    exit 1
}

# Function to display a warning message
function warn_message {
    echo "⚠️ Warning: $1" >&2
}

# --- Welcome Message ---
echo "🚀 Welcome to your dotfiles setup script!"
echo "This script will help you set up your dotfiles using GNU Stow."
echo "------------------------------------------------------------"

# --- Check for GNU Stow ---
echo "Checking for GNU Stow..."
if ! command -v stow &> /dev/null; then
    error_exit "GNU Stow is not installed. Please install it first (e.g., 'sudo apt install stow' on Debian/Ubuntu, 'brew install stow' on macOS)."
fi
echo "✅ GNU Stow found."

# --- Stow Operations ---
echo "------------------------------------------------------------"
echo "Starting GNU Stow operations..."

packages_to_stow=("kanata" "nvim" "wezterm-linux" "powershell" "zshrc") # Add all your packages here

all_packages_stowed_successfully=true # Flag to track overall success

for package in "${packages_to_stow[@]}"; do
    echo "  Stowing '$package'..."

    if [ -d "$package" ]; then # Check if the package directory exists
        stow --target="$HOME" "$package"
        if [ $? -ne 0 ]; then
            warn_message "Failed to stow '$package'. Please check for conflicts or errors. Skipping this package."
            all_packages_stowed_successfully=false
        else
            echo "  ✅ '$package' stowed successfully."
        fi
    else
        warn_message "Directory '$package' not found in the current location. Skipping stow for '$package'."
        all_packages_stowed_successfully=false
    fi
done

echo "------------------------------------------------------------"

if "$all_packages_stowed_successfully"; then
    echo "🎉 All dotfiles stowed successfully!"
else
    echo "⚠️ Some dotfiles failed to stow or were skipped. Please review the warnings above."
fi

echo "------------------------------------------------------------"
echo "Please restart your terminal or source your shell configuration (e.g., 'source ~/.bashrc' or 'source ~/.zshrc') for changes to take effect."
echo "If you encounter issues, you might need to manually resolve conflicts or inspect stow's output."
