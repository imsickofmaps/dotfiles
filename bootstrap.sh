#!/bin/bash
# Bootstrap script for setting up a new macOS machine
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "🚀 Setting up macOS..."

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    echo "📦 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install packages from Brewfile
echo "📦 Installing packages from Brewfile..."
brew bundle --file="$SCRIPT_DIR/Brewfile"

# Install global npm packages
echo "📦 Installing global npm packages..."
grep -v '^#' "$SCRIPT_DIR/npm-global-packages" | grep -v '^\s*$' | xargs -r npm install -g

# Initialize chezmoi with this repo
echo "🔧 Setting up dotfiles with chezmoi..."
chezmoi init --source="$SCRIPT_DIR" --apply

# Apply macOS defaults
echo "⚙️  Applying macOS preferences..."
"$SCRIPT_DIR/macos-defaults.sh"

# Set fish as default shell
echo "🐟 Setting fish as default shell..."
FISH_PATH="$(which fish)"
if ! grep -q "$FISH_PATH" /etc/shells; then
    echo "$FISH_PATH" | sudo tee -a /etc/shells
fi
chsh -s "$FISH_PATH"

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal"
echo "  2. Open Neovim and let plugins install"
