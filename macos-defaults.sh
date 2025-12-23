#!/bin/bash
# macOS System Preferences
# Converted from nix-darwin system.defaults

set -e

echo "⚙️  Applying macOS preferences..."

# Keyboard - Remap Caps Lock to Escape
# Note: Handled by Karabiner-Elements (installed via Brewfile)

# Dock
defaults write com.apple.dock orientation -string "bottom"
defaults write com.apple.dock tilesize -int 32
# Disable hot corner bottom-right (wvous-br-corner = 1 means disabled)
defaults write com.apple.dock wvous-br-corner -int 1
defaults write com.apple.dock wvous-br-modifier -int 0

# Finder
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Trackpad - Enable right-click
# defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

# Apply changes
killall Dock Finder 2>/dev/null || true

echo "✅ macOS defaults applied. Some changes may require logout."
