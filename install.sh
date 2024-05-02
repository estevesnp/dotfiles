#! /bin/sh

sudo pacman -Sy --needed zsh stow tmux fzf ripgrep fd go rustup neovim gcc xclip nodejs npm

stow .

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

rustup default stable
