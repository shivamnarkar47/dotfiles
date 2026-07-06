# dotfiles

Stow-managed configs for nvim, zsh, git, hypr, i3, tmux, and fastfetch.


See [WSL_SETUP.md](WSL_SETUP.md) for specialized instructions if you are using Windows Subsystem for Linux.
## Quick Start

```bash
# Install stow
sudo pacman -S stow    # Arch
sudo apt install stow  # Debian/Ubuntu

# Clone & stow
git clone https://github.com/shivamnarkar47/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow nvim zsh git hypr i3 tmux fastfetch
```

## Structure

```
dotfiles/
├── fastfetch/ → ~/.config/fastfetch
├── git/       → ~/.gitconfig
├── hypr/      → ~/.config/hypr
├── i3/        → ~/.config/i3
├── nvim/      → ~/.config/nvim
├── tmux/      → ~/.tmux.conf
└── zsh/       → ~/.zshrc
```

## Managing
```bash
# Stow all
stow nvim zsh git hypr i3 tmux fastfetch

# Unstow single (e.g. hypr)
stow -D hypr

# Restow (update links for all)
stow -R nvim zsh git hypr i3 tmux fastfetch
```

## Update from machine

```bash
cd ~/dotfiles
git add -A
git commit -m "update"
git push
```

## Hypr Notes

The Hypr config uses ML4W configuration with Lua scripting for monitor setup.