# dotfiles

Stow-managed configs for nvim, zsh, git, hypr.

## Quick Start

```bash
# Install stow
sudo pacman -S stow    # Arch
sudo apt install stow  # Debian/Ubuntu

# Clone & stow
git clone https://github.com/shivamnarkar47/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow nvim zsh git hypr
```

## Structure

```
dotfiles/
├── nvim/   → ~/.config/nvim
├── zsh/    → ~/.zshrc
├── git/    → ~/.gitconfig
└── hypr/   → ~/.config/hypr
```

## Managing

```bash
# Stow all
stow nvim zsh git hypr

# Unstow single
stow -D hypr

# Restow (update links)
stow -R hypr
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