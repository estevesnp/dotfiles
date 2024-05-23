# Dotfiles

These are my dotfiles. I manage them with `stow`.

## Installation

To clone the repo and it's submodules, run:

```sh
git clone --recursive git@github.com:estevesnp/dotfiles.git
```

If you forgot to clone with `--recursive`, you can run:

```sh
git submodule update --init --recursive
```

## Dependencies

- `zsh`
- `stow`
- `tmux`
- `fzf`
- `go`
- `rust`
- `java`
- `gcc`
- `neovim`
    - `xclip` - for clipboard support
    - `ripgrep` - for telescope
    - `fd` - for telescope
    - `nodejs` - for copilot
    - `npm` - for ts-language-server
