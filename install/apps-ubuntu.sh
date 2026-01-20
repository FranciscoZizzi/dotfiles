#!/bin/bash

echo_info() { echo -e "\e[34m[INFO]\e[0m $1"; }
echo_success() { echo -e "\e[32m[SUCCESS]\e[0m $1"; }

# 1. Install Latest Neovim (via Tarball)
echo_info "Installing Neovim from official tarball..."

# Download to a temporary location
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz

# Extract it
tar xzvf nvim-linux-x86_64.tar.gz

# Clean up old version if it exists
rm -rf ~/.local/bin/nvim ~/.local/lib/nvim ~/.local/share/nvim /opt/nvim-linux64

# Move it to ~/.local (a standard place for user-installed binaries)
# This keeps it out of system folders but accessible to your user
mkdir -p /opt/
cp -r nvim-linux-x86_64/* /opt/

# Clean up the downloaded files
rm -rf nvim-linux-x86_64 nvim-linux-x86_64.tar.gz

echo_success "Neovim installed to ~/.local/bin/nvim"

# 2. Install Ghostty
echo_info "Installing Ghostty..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"

echo_success "Neovim and Ghostty are now at their latest versions!"
