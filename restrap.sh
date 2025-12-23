#!/bin/bash
# Script for updating macOS machine
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "🚀 Updating macOS..."

# # Install Homebrew if not present
# if ! command -v brew &> /dev/null; then
#     echo "📦 Installing Homebrew..."
#     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#     eval "$(/opt/homebrew/bin/brew shellenv)"
# fi

# Update packages from Brewfile
echo "📦 Installing packages from Brewfile..."
brew bundle --file="$SCRIPT_DIR/Brewfile"



# # Initialize chezmoi with this repo
# echo "🔧 Setting up dotfiles with chezmoi..."
# chezmoi init --source="$SCRIPT_DIR" --apply
echo "🔧 Updating dotfiles with chezmoi..."
chezmoi apply --source="$SCRIPT_DIR"

# # Apply macOS defaults
# echo "⚙️  Applying macOS preferences..."
# "$SCRIPT_DIR/macos-defaults.sh"

# # Set fish as default shell
# echo "🐟 Setting fish as default shell..."
# FISH_PATH="$(which fish)"
# if ! grep -q "$FISH_PATH" /etc/shells; then
#     echo "$FISH_PATH" | sudo tee -a /etc/shells
# fi
# chsh -s "$FISH_PATH"

# echo ""
# echo "✅ Setup complete!"
# echo ""
# echo "Next steps:"
# echo "  1. Restart your terminal"
# echo "  2. Open Neovim and let plugins install"
