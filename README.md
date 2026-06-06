# dotfiles

these are my dotfiles. i manage them with `stow`.

## installation

to clone the repo and it's submodules, run:

```sh
git clone --recursive git@github.com:estevesnp/dotfiles.git
```

if you forgot to clone with `--recursive`, you can run:

```sh
git submodule update --init --recursive
```

or just run [setup.sh](./setup.sh)

## main apps

- zsh
- git
- nvim
- ghostty
  - can configer local overrides in `.config/ghostty/local.config`
- stow
- fzf
- tmux
- yazi
  - can install with `cargo install --locked yazi-fm yazi-cli`
- bat
  - run to load themes: `bat cache --build`

## dependencies

### nvim

check [nvim dependencies](https://github.com/estevesnp/nvimrc/blob/main/README.md#notable-dependencies)
