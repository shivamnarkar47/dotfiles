# dotfiles

Stow-managed config.

## Install

```bash
# Install stow (Arch)
sudo pacman -S stow

# Or Debian/Ubuntu
sudo apt install stow
```

## Usage

```bash
cd ~/dotfiles
stow nvim zsh git
```

Stow creates symlinks: `~/.config/nvim -> dotfiles/nvim`, etc.

## Unstow

```bash
stow -D nvim
```