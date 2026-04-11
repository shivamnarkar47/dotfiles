# dotfiles

Stow-managed configs for nvim, zsh, git.

## Quick Start

```bash
# Install stow
sudo pacman -S stow    # Arch
sudo apt install stow  # Debian/Ubuntu

# Clone & stow
git clone https://github.com/shivamnarkar47/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow nvim zsh git
```

## Structure

```
dotfiles/
├── nvim/   → ~/.config/nvim
├── zsh/    → ~/.zshrc
└── git/    → ~/.gitconfig
```

## Managing

```bash
# Stow all
stow nvim zsh git

# Unstow single
stow -D nvim

# Restow (update links)
stow -R nvim
```

## Update from machine

```bash
cd ~/dotfiles
git add -A
git commit -m "update"
git push
```