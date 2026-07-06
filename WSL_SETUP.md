# WSL Setup Guide

Setting up these dotfiles on Windows Subsystem for Linux (WSL) requires a few specific steps to ensure compatibility, especially concerning window managers and specialized utilities.

## Prerequisites

1.  **Install WSL**: Ensure you have a Linux distribution (e.g., Ubuntu) installed.
2.  **Install Stow**:
    ```bash
    sudo apt update
    sudo apt install stow
    ```
3.  **Install Dependencies**:
    You will need to install the tools required by your configuration:
    ```bash
    sudo apt install git neovim tmux fastfetch
    ```

## Setup Steps

1.  **Clone the dotfiles**:
    ```bash
    git clone https://github.com/shivamnarkar47/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    ```

2.  **Stow relevant packages**:
    Since WSL does not have a native X11/Wayland display server by default (unlike a bare-metal Linux install), you should only stow the terminal-based configs:
    ```bash
    stow nvim zsh git tmux fastfetch
    ```

> [!CAUTION]
> Do **not** stow `hypr` or `i3` configs on WSL, as they are designed for X11/Wayland environments which are not natively supported in standard WSL setups.

## Additional WSL Considerations

- **Zsh/Shell**: You may need to change your default shell to Zsh after stowing:
  ```bash
  chsh -s $(which zsh)
  ```
- **Neovim**: Neovim might require specific language servers or compilers (like `gcc`, `ripgrep`, `fd-find`) installed via `apt` for full plugin functionality.
- **Git**: Ensure your global `.gitconfig` is configured correctly for WSL line endings:
  ```bash
  git config --global core.autocmd input
  ```
