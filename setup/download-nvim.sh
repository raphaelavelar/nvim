#!/bin/bash

# Configures Neovim for GitHub Codespaces
# The script downloads the latest Neovim release to /tmp, extracts it and creates a syslink to the executable in
# /usr/local/bin for global access.

set -e  # Exit on error

DELETE=false
NEOVIM_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"

echo "🔧 Starting Neovim configuration..."
echo "📥 Creating temporary directory for download/extract..."

TMP_DIR=$(mktemp -d)
TMP_TAR="$TMP_DIR/nvim-linux-x86_64.tar.gz"

echo "📥 Downloading Neovim to $TMP_TAR..."
if command -v wget >/dev/null 2>&1; then
	wget -q -O "$TMP_TAR" "$NEOVIM_URL"
elif command -v curl >/dev/null 2>&1; then
	curl -sL -o "$TMP_TAR" "$NEOVIM_URL"
else
	echo "Error: neither wget nor curl is installed. Install one and retry."
	exit 1
fi

echo "📦 Extracting Neovim into $TMP_DIR..."
tar xzf "$TMP_TAR" -C "$TMP_DIR"

NVIM_DIR="$TMP_DIR/nvim-linux-x86_64"

echo "🔗 Creating symlink for global access..."
if [ -d "$NVIM_DIR" ]; then
	sudo ln -sf "$NVIM_DIR/bin/nvim" /usr/local/bin/nvim
	echo "✅ Symlink created at: /usr/local/bin/nvim -> $NVIM_DIR/bin/nvim"
else
	echo "Error: extracted directory $NVIM_DIR not found"
	exit 1
fi

echo "📋 Copying neovim configuration to ~/.config/nvim..."
CONFIG_DIR="$HOME/.config/nvim"
mkdir -p "$CONFIG_DIR"
cp -r "$(git rev-parse --show-toplevel)"/* "$CONFIG_DIR/" 2>/dev/null || true
rm -rf "$CONFIG_DIR/setup"

echo "✅ Configuration files copied to $CONFIG_DIR"
echo "✅ Download and configuration complete!"