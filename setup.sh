#!/usr/bin/env bash

set -e

if ! command -v stow > /dev/null 2>&1; then
    echo "stow not found, the setup depends on it. please install it"
    exit 1
fi

if [ ! -e "$HOME/.gitconfig" ]; then
    cp .gitconfig "$HOME"
fi

git submodule update --init --recursive

if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
    git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# to make sure the individual dirs inside .config get linked
mkdir -p "$HOME/.config"

stow .

if [[ "$(uname)" == "Darwin" ]]; then
    ./macos.sh
fi

if command -v bat > /dev/null 2>&1; then
    bat cache --build
fi

utils=(nvim tmux fzf zoxide ripgrep fd)
util_missing=false

for util in "${utils[@]}"; do
    if command -v "$util" > /dev/null 2>&1; then
        continue
    fi

    if [ "$util_missing" != true ]; then
        util_missing=true
        echo "useful utilities missing from path:"
    fi

    echo "  - $util"
done
