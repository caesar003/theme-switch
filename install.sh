#!/bin/bash

# Directories for installation
BIN_DIR="/usr/local/bin"
CONFIG_DIR="$HOME/.config/theme-switch"
COMPLETION_DIR="/etc/bash_completion.d"
MAN_DIR="/usr/local/share/man/man1"

# Ensure the script is run with sudo
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root. Use sudo to install."
	exit 1
fi

# Step 1: Install the main script
echo "Installing theme-switch to $BIN_DIR..."
install -Dm755 bin/theme-switch "$BIN_DIR/theme-switch"

# Step 2: Install configuration files
echo "Setting up configuration files in $CONFIG_DIR..."
mkdir -p "$CONFIG_DIR/templates"
install -Dm644 config/theme-switch/templates/kitty-dark "$CONFIG_DIR/templates/kitty-dark"
install -Dm644 config/theme-switch/templates/kitty-light "$CONFIG_DIR/templates/kitty-light"
install -Dm644 config/theme-switch/templates/nvim-dark "$CONFIG_DIR/templates/nvim-dark"
install -Dm644 config/theme-switch/templates/nvim-light "$CONFIG_DIR/templates/nvim-light"
install -Dm644 config/theme-switch/templates/vim-dark "$CONFIG_DIR/templates/vim-dark"
install -Dm644 config/theme-switch/templates/vim-light "$CONFIG_DIR/templates/vim-light"
install -Dm644 config/theme-switch/theme.conf "$CONFIG_DIR/theme.conf"

# Step 3: Install bash completion script
echo "Installing bash completion script to $COMPLETION_DIR..."
install -Dm644 share/bash-completion/completions/theme-switch "$COMPLETION_DIR/theme-switch"

# Step 4: Install man page
echo "Installing man page to $MAN_DIR..."
install -Dm644 share/man/man1/theme-switch.1 "$MAN_DIR/theme-switch.1"
mandb # Update the man database

# Completion message
echo "Installation complete. You can now use 'theme-switch' from the command line."
echo "Remember to source the bash completion file or restart your terminal to enable auto-completion."
