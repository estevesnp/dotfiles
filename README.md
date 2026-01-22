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
- stow
- fzf
- tmux
- zoxide
  - `cargo install --locked zoxide`
- yazi
  - `cargo install --locked yazi-fm yazi-cli`
- bat
  - `bat cache --build`

## dependencies

### nvim

check [nvim dependencies](https://github.com/estevesnp/nvimrc/blob/main/README.md#notable-dependencies)
