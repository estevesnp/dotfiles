#!/usr/bin/env bash

# installed automatically
pkgs=(
    neovim
    vim
    zsh
    stow
    less
    mandoc
    man-pages
    btop
    unzip
    strace

    tmux
    fzf
    jq
    fx
    zoxide
    ripgrep
    fd
    yazi
    bat
    eza
    tree-sitter-cli

    zvm
    rustup
    go
    clang
    npm
)

# ask before installing
apps=(
    ghostty
    brave-bin
    1password
    1password-cli
    spotify
)

setup_pkgs() {
    echo 'setting up zig'
    zvm i --zls 0.15.2
    zvm i --zls master

    echo 'setting up rust'
    rustup default stable
    rustup component add rust-analyzer
}

setup-nix() {
    echo 'installing nix'
    yay -S --needed --noconfirm nix

    echo 'adding user to nixbld group'
    sudo usermod -a -G nixbld "$USER"

    echo 'setting up nix-daemon'
    sudo systemctl enable --now nix-daemon

    echo 'adding nix unstable channel'
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
    nix-channel --update

    echo 'nix installation done. make sure to add "~/.nix-profile/bin" to your PATH to use bins installed by "nix-env"'
}

install_yay() {
    echo 'installing base deps'
    sudo pacman -S --needed --noconfirm git base-devel

    echo 'cloning repo'
    git clone https://aur.archlinux.org/yay.git
    cd yay

    echo 'building yay, get ready for more sudo'
    makepkg -si

    echo 'cleaning up'
    cd -
    rm -rf yay
}

if ! command -v yay &> /dev/null; then
    echo 'yay not in path, building locally'
    install_yay
fi

read -rp 'install packages? [y/N] ' answer
if [[ "$answer" =~ ^[yY] ]]; then
    yay -S --needed --noconfirm "${pkgs[@]}"
    setup_pkgs
fi

read -rp "install applications? (${apps[*]}) [y/N] " answer
if [[ "$answer" =~ ^[yY] ]]; then
    echo 'installing applications'
    yay -S --needed --noconfirm "${apps[@]}"
fi

read -rp 'setup nix? [y/N] ' answer
if [[ "$answer" =~ ^[yY] ]]; then
    echo 'setting up nix'
    setup-nix
fi
