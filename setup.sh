#!/bin/bash

# Simple colors for output
echo_info() { echo -e "\e[34m[INFO]\e[0m $1"; }
echo_success() { echo -e "\e[32m[SUCCESS]\e[0m $1"; }

echo_info "Starting Ubuntu dotfiles setup..."

# 1. Install dependencies
echo_info "Installing Stow and Git..."
sudo apt update && sudo apt install -y stow git

# 2. Handle existing .bashrc (Move it to a backup)
if [ -f ~/.bashrc ] && [ ! -L ~/.bashrc ]; then
    echo_info "Backing up existing .bashrc to ~/.bashrc.bak"
    mv ~/.bashrc ~/.bashrc.bak
fi

# 3. Use Stow to create symlinks
echo_info "Linking configurations with Stow..."
cd ~/dotfiles

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
if [ -f ~/dotfiles/gnome/load_settings.sh ]; then
    echo_info "Restoring GNOME desktop settings..."
    bash ~/dotfiles/gnome/load_settings.sh
fi

echo_success "Setup complete! Please restart your terminal."
