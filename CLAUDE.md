# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

macOS dotfiles managed with **chezmoi**. Files prefixed with `dot_` (e.g., `dot_config/`) map to `~/` targets (e.g., `~/.config/`). The `Brewfile` is the single source of truth for all installed packages.

## Key Commands

- `chezmoi apply` — apply dotfile changes to the system
- `chezmoi diff` — preview what chezmoi would change
- `brew bundle` — install/sync packages from Brewfile
- `npm install -g <pkg>` — after adding to `npm-global-packages`
- `./bootstrap.sh` — full setup for a new machine (installs Homebrew, runs brew bundle, chezmoi init, macOS defaults, sets fish as default shell)
- `./macos-defaults.sh` — re-apply macOS system preferences

## Architecture

- **chezmoi** handles symlinking: `dot_config/` → `~/.config/`, `dot_gitconfig` → `~/.gitconfig`, etc.
- `.chezmoiignore` excludes repo-only files (Brewfile, scripts, README) from chezmoi management
- **Unified Catppuccin Mocha theme** across Starship, Tmux, GitUI, Ghostty, and Neovim
- **Caps Lock → Hyper key** (Cmd+Ctrl+Opt) via Karabiner-Elements, used for Aerospace window management

## Neovim Setup

LazyVim-based config in `dot_config/nvim/`. Plugin specs live in `lua/plugins/`, core config in `lua/config/`. LSP support for Go (gopls), Python (pyright + ruff), and Solidity. Uses Snacks.nvim for file picking/search (telescope is disabled). Formatting via conform.nvim (stylua, isort, gofmt).

## When Editing

- Adding a brew package: edit `Brewfile`, then `brew bundle`
- Adding a global npm package: add to `npm-global-packages`, then `restrap.sh` (or `npm install -g <pkg>`)
- Adding/changing a dotfile: edit the `dot_`-prefixed source in this repo, then `chezmoi apply`
- Neovim plugins: add a new file or edit existing ones in `dot_config/nvim/lua/plugins/`
