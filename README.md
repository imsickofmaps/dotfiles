# dotfiles

macOS configuration managed with Homebrew, chezmoi, and shell scripts.

hattip @allank 

## Quick Start (New Machine)

```bash
git clone https://github.com/imsickofmaps/dotfiles ~/Dev/dotfiles
cd ~/Dev/dotfiles
./bootstrap.sh
```

## Daily Usage

| Task | Command |
|------|---------|
| **Add/remove packages** | Edit `Brewfile` → `brew bundle` |
| **Update all packages** | `brew upgrade` |
| **Apply dotfile changes** | `chezmoi apply` |
| **Re-apply macOS settings** | `./macos-defaults.sh` |
| **See what chezmoi would change** | `chezmoi diff` |
| **Edit a dotfile** | `chezmoi edit ~/.config/fish/config.fish` |

## Structure

```
├── Brewfile              # All packages, casks, taps, fonts
├── bootstrap.sh          # One-time setup for new machines
├── macos-defaults.sh     # macOS system preferences
│
├── dot_config/           # → ~/.config/
│   ├── fish/config.fish
│   ├── nvim/
│   ├── starship.toml
│   ├── aerospace/
│   ├── ghostty/
│   ├── gitui/
│   ├── karabiner/
│   └── tmux/
│
├── dot_gitconfig         # → ~/.gitconfig
└── dot_gitignore_global  # → ~/.gitignore_global
```

## What's Included

### CLI Tools
fish, neovim, bat, eza, ripgrep, fzf, jq, starship, grc, tmux, gitui, dust, yazi, xh, atac

### Development
python, uv, ruff, go, gopls, node, hugo, foundry, docker, colima

### GUI Apps
Discord, Spotify, Firefox, Obsidian, Bitwarden, Alfred, Ghostty, Aerospace, Karabiner-Elements, Antigravity,and more

### macOS Settings
- Dock on bottom, small icons
- Finder shows path bar and status bar  
- Caps Lock → Hyper key (Cmd+Ctrl+Opt) via Karabiner-Elements
