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

    ghostty
    tmux

    zoxide
    fzf
    jq
    ripgrep
    fd
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
    brave-bin
    1password
    1password-cli
    spotify
)

setup() {
    echo 'setting up zig'
    zvm i --zls master
    zvm i --zls 0.15.2

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
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable
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

echo 'installing packages'
yay -S --needed --noconfirm "${pkgs[@]}"

echo "install applications? (${apps[@]})"
read -p '[y/N] ' answer
if [[ "$answer" =~ ^[yY] ]]; then
    echo 'installing applications'
    yay -S --needed --noconfirm "${apps[@]}"
fi

echo 'running setup'
setup

read -p 'setup nix? [y/N] ' answer
if [[ "$answer" =~ ^[yY] ]]; then
    echo 'setting up nix'
    setup-nix
fi
