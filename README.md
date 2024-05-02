# Dotfiles

This are my dotfiles. I manage them with `stow`.

## Requirements

The instalation assumes you have `git` and `pacman` installed.

You will also need to backup your current dotfiles (`~/.zshrc`, `~/.config/nvim`, etc).

## Installation

Simply run the following commands:

```sh
git clone https://github.com/estevesnp/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## Installed packages

- `zsh`
- `stow`
- `tmux`
- `fzf`
- `go`
- `rust`
- `neovim`
    - `gcc` - for tree-sitter
    - `xclip` - for clipboard support
    - `ripgrep` - for telescope
    - `fd` - for telescope
    - `nodejs` - for copilot
    - `npm` - for ts-language-server
