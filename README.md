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
| **Add/remove brew packages** | Edit `Brewfile` → `brew bundle` |
| **Add/remove global npm packages** | Edit `npm-global-packages` → `./restrap.sh` |
| **Update all packages** | `brew upgrade` |
| **Apply dotfile changes** | `chezmoi apply` |
| **Re-apply macOS settings** | `./macos-defaults.sh` |
| **See what chezmoi would change** | `chezmoi diff` |
| **Edit a dotfile** | `chezmoi edit ~/.config/fish/config.fish` |

## Structure

```
├── Brewfile              # All packages, casks, taps, fonts
├── npm-global-packages   # Global npm packages (one per line)
├── bootstrap.sh          # One-time setup for new machines
├── restrap.sh            # Update script for existing machines
├── macos-defaults.sh     # macOS system preferences
│
├── dot_config/           # → ~/.config/
│   ├── aerospace/
│   ├── chezmoi/
│   ├── fish/config.fish
│   ├── ghostty/
│   ├── gitui/
│   ├── karabiner/
│   ├── nvim/
│   ├── starship.toml
│   └── tmux/
│
├── dot_docker/           # → ~/.docker/
├── dot_gitconfig         # → ~/.gitconfig
└── dot_gitignore_global  # → ~/.gitignore_global
```

## What's Included

### CLI Tools
fish, neovim, bat, eza, ripgrep, fzf, jq, starship, grc, tmux, dust, yazi, xh, llm, datasette, gogcli, gh, gemini-cli

### Development
python, uv, ruff, go, gopls, node, hugo, foundry, docker, docker-compose, colima, qemu

### GUI Apps
Discord, Spotify, Firefox, Obsidian, Alfred, Ghostty, Aerospace, Karabiner-Elements, Antigravity, Whatsapp, Zotero, Transmission, Hammerspoon, Docker Desktop, Notion, Zappy, Claude, Miro

### macOS Settings
- Dock on bottom, small icons
- Finder shows path bar and status bar  
- Caps Lock → Hyper key (Cmd+Ctrl+Opt) via Karabiner-Elements
