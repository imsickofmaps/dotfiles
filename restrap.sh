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

# Sync global npm packages (install missing, remove unlisted)
echo "📦 Syncing global npm packages..."
NPM_WANTED=$(grep -v '^#' "$SCRIPT_DIR/npm-global-packages" | grep -v '^\s*$' | sort)
if [ -n "$NPM_WANTED" ]; then
    NPM_INSTALLED=$(npm ls -g --depth=0 --parseable 2>/dev/null | tail -n +2 | xargs -I{} basename {} | grep -v '^npm$' | sort)
    NPM_TO_REMOVE=$(comm -23 <(echo "$NPM_INSTALLED") <(echo "$NPM_WANTED"))
    if [ -n "$NPM_TO_REMOVE" ]; then
        echo "$NPM_TO_REMOVE" | xargs npm uninstall -g
    fi
    echo "$NPM_WANTED" | xargs npm install -g
fi

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
