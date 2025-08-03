#!/usr/bin/env bash

set -e

git submodule update --init --recursive

git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if [ ! -e "$HOME/.gitconfig" ]; then
    cp .gitconfig "$HOME"
fi

# to make sure the individual dirs inside .config get linked
mkdir -p "$HOME/.config"

stow .

if [[ "$(uname)" == "Darwin" ]]; then
    ./macos.sh
fi
