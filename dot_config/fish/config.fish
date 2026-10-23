# Fish configuration
# Converted from home-manager (modules/user.nix)

# PATH configuration
# Use brew shellenv so both bin *and* sbin end up on PATH (network tools like
# mtr live in sbin), plus MANPATH/INFOPATH — stays correct across brew changes.
if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv fish | source
end
fish_add_path ~/.local/bin

# Homebrew settings
set -gx HOMEBREW_NO_ENV_HINTS 1

# Aliases
alias ls="eza --color=always"
alias cat="bat"
alias less="bat"

# Key bindings for bash-style history expansion
function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t -- $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -f backward-delete-char history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end

# Initialize starship prompt
if command -q starship
    starship init fish | source
end

# Initialize fzf key bindings
if command -q fzf
    fzf --fish | source
end

# Initialize grc (colorizer)
if command -q grc
    source /opt/homebrew/etc/grc.fish 2>/dev/null || true
end

# LM Studio CLI (lms)
fish_add_path --append ~/.lmstudio/bin
