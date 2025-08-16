#!/usr/bin/env bash

set -e

git submodule update --init --recursive

if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
    git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi


if [ ! -e "$HOME/.gitconfig" ]; then
    cp .gitconfig "$HOME"
fi

# to make sure the individual dirs inside .config get linked
mkdir -p "$HOME/.config"

stow .

if [[ "$(uname)" == "Darwin" ]]; then
    ./macos.sh
fi
