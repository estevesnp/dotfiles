#! /bin/sh


sudo pacman -Sy --needed zsh stow tmux fzf ripgrep fd go rustup neovim gcc xclip nodejs npm

stow .

rustup default stable
