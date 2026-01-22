#!/usr/bin/env bash

set -e

PRE_ZSHRC_INIT="$HOME/.zshrc_pre_init"
POST_ZSHRC_INIT="$HOME/.zshrc_post_init"

required_apps=(git stow)
required_missing=false

for required in "${required_apps[@]}"; do
    if ! command -v "$required" > /dev/null 2>&1; then
        required_missing=true
        echo "$required not found in path, but is a required tool. please install it and re-run"
    fi
done

if [ "$required_missing" = true ]; then
    exit 1
fi


if [ ! -e "$HOME/.gitconfig" ]; then
    cp .gitconfig "$HOME"
else
    echo ".gitconfig already exists in $HOME, skipping..."
fi

git submodule update --init --recursive

# to make sure the individual dirs inside .config get linked
mkdir -p "$HOME/.config"

stow .

for initpath in "$PRE_ZSHRC_INIT" "$POST_ZSHRC_INIT"; do
    if [ ! -e "$initpath" ]; then
        touch "$initpath"
    else
        echo "$initpath already exists, skipping..."
    fi
done


if command -v bat > /dev/null 2>&1; then
    echo "building bat cache..."
    bat cache --build
else
    echo "bat doesn't exist in path. if added, run 'bat cache --build' afterwards"
fi

utils=(nvim tmux fzf less tar curl rg fd jq zoxide yazi bat gh tree-sitter)
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
