#!/bin/bash

# Capture the user's real home directory and username
# This ensures that even if a sub-command uses sudo, we know who 'you' are.
USER_HOME=$HOME
DOTFILES_DIR="$USER_HOME/dotfiles"

# Simple colors for output
echo_info() { echo -e "\e[34m[INFO]\e[0m $1"; }
echo_success() { echo -e "\e[32m[SUCCESS]\e[0m $1"; }

echo_info "Starting Ubuntu dotfiles setup..."

# 1. Install dependencies
echo_info "Installing Stow and Git..."
sudo apt update && sudo apt install -y stow git
sudo apt install curl -y

# 2. Handle existing .bashrc (Move it to a backup)
if [ -f "$DOTFILES_DIR/.bashrc" ] && [ ! -L "$DOTFILES_DIR/.bashrc" ]; then
    echo_info "Backing up existing .bashrc to $DOTFILES_DIR/.bashrc.bak"
    mv "$DOTFILES_DIR/.bashrc" "$DOTFILES_DIR/.bashrc.bak"
fi

# 3. Use Stow to create symlinks
echo_info "Linking configurations with Stow..."
cd "$DOTFILES_DIR/dotfiles"

for dir in */ ; do
	target=${dir%/}

	if [[ "$target" == "gnome" ]]; then
		echo_info "Skipping $target (not a stow package)"
		continue
	fi

	echo_info "Stowing $target..."
	stow "$target"
done

# 4. Restore GNOME settings
if [ -f "$DOTFILES_DIR/dotfiles/gnome/load_settings.sh" ]; then
    echo_info "Restoring GNOME desktop settings..."
    bash "$DOTFILES_DIR/dotfiles/gnome/load_settings.sh"
fi

echo_success "Setup complete! Please restart your terminal."

# 5. Install latest apps
echo_info "Installing latest apps..."
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	bash "$DOTFILES_DIR/dotfiles/install/apps-ubuntu.sh"
fi

