#!/usr/bin/env bash

set -e

TPM_PATH="$HOME/.tmux/plugins/tpm"
PRE_ZSHRC_INIT="$HOME/.zshrc-pre-init"
POST_ZSHRC_INIT="$HOME/.zshrc-post-init"

if ! command -v stow > /dev/null 2>&1; then
    echo "stow not found, the setup depends on it. please install it"
    exit 1
fi

if [ ! -e "$HOME/.gitconfig" ]; then
    cp .gitconfig "$HOME"
fi

git submodule update --init --recursive

if [ ! -e "$TPM_PATH" ]; then
    git clone --depth 1 https://github.com/tmux-plugins/tpm "$TPM_PATH"
fi

# to make sure the individual dirs inside .config get linked
mkdir -p "$HOME/.config"

stow .

for initpath in "$PRE_ZSHRC_INIT" "$POST_ZSHRC_INIT"; do
    if [ ! -e "$initpath" ]; then
        touch "$initpath"
    fi
done


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
