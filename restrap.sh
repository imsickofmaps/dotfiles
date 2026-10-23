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
brew bundle --file="$SCRIPT_DIR/Brewfile" || echo "⚠️  brew bundle had failures, continuing..."

# Sync global npm packages (install missing, remove unlisted)
echo "📦 Syncing global npm packages..."
NPM_WANTED=$(grep -v '^#' "$SCRIPT_DIR/npm-global-packages" | grep -v '^\s*$' | sort)
if [ -n "$NPM_WANTED" ]; then
    # Strip the global root prefix so scoped packages keep their @scope/ part
    NPM_ROOT="$(npm root -g)"
    NPM_INSTALLED=$(npm ls -g --depth=0 --parseable 2>/dev/null | grep "^$NPM_ROOT/" | sed "s|^$NPM_ROOT/||" | grep -vxE 'npm|corepack' | sort)
    NPM_TO_REMOVE=$(comm -23 <(echo "$NPM_INSTALLED") <(echo "$NPM_WANTED"))
    if [ -n "$NPM_TO_REMOVE" ]; then
        echo "$NPM_TO_REMOVE" | xargs npm uninstall -g
    fi
    echo "$NPM_WANTED" | xargs npm install -g
fi

# Sync uv tools (install missing, remove unlisted)
echo "📦 Syncing uv tools..."
UV_WANTED=$(grep -v '^#' "$SCRIPT_DIR/uv-tools" | grep -v '^\s*$' | sort)
# Skip the "- <executable>" lines uv prints under each tool
UV_INSTALLED=$(uv tool list 2>/dev/null | awk '!/^-/ && !/^No tools/ {print $1}' | sort)
if [ -n "$UV_INSTALLED" ]; then
    UV_TO_REMOVE=$(comm -23 <(echo "$UV_INSTALLED") <(echo "$UV_WANTED"))
    if [ -n "$UV_TO_REMOVE" ]; then
        echo "$UV_TO_REMOVE" | xargs -I{} uv tool uninstall {}
    fi
fi
if [ -n "$UV_WANTED" ]; then
    echo "$UV_WANTED" | while read -r pkg; do
        uv tool install "$pkg"
    done
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
