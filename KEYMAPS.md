# Keymaps Reference

Quick reference for all custom keybindings for Neovim.

> **Legend**: `<leader>` = Space, `C-` = Ctrl, `S-` = Shift, `alt-cmd-ctrl` = ⌥⌘⌃
> **Note**: ⌥⌘⌃ is remaps to `<CAPS>` for ease of use
---

## Neovim

### General

| Key | Action |
|-----|--------|
| `Esc` | Clear search highlighting |
| `Y` | Yank to end of line |

### Diagnostics

| Key | Action |
|-----|--------|
| `[d` | Go to previous diagnostic |
| `]d` | Go to next diagnostic |
| `<leader>e` | Show diagnostic error messages |
| `<leader>q` | Open diagnostic quickfix list |

### Window Navigation

| Key | Action |
|-----|--------|
| `C-h` | Move focus left |
| `C-j` | Move focus down |
| `C-k` | Move focus up |
| `C-l` | Move focus right |

### Buffer Management

| Key | Action |
|-----|--------|
| `Tab` | Next buffer |
| `S-Tab` | Previous buffer |
| `<leader>bd` | Close current buffer |

### Text Manipulation (Visual Mode)

| Key | Action |
|-----|--------|
| `K` | Move selected lines up |
| `J` | Move selected lines down |

### Command Mode

| Key | Action |
|-----|--------|
| `C-a` | Move to start of line |
| `C-e` | Move to end of line |
| `C-f` | Insert current file path |

### Search (Snacks Picker)

| Key | Action |
|-----|--------|
| `<leader>sf` | Search files |
| `<leader>sb` | Browse files (explorer) |
| `<leader><leader>` | Find buffers |
| `<leader>/` | Fuzzy search current buffer |
| `<leader>s/` | Search in open files |
| `<leader>sg` | Search by grep |
| `<leader>sw` | Search current word |
| `<leader>ss` | Select picker |
| `<leader>sd` | Search diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Recent files |
| `<leader>sh` | Search help |
| `<leader>sk` | Search keymaps |
| `<leader>sn` | Search Neovim config files |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `<leader>D` | Type definition |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
