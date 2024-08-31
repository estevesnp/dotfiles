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

## main apps

- `zsh`
- `stow`
- `alacritty`
- `nvim`
- `fzf`
- `tmux`
- `tms`
- `yazi`

## dependencies

### nvim

- `gcc` (tree-sitter)
- `xclip` (clipboard, check `:h clipboard`)
- `fd` (telescope)
- `ripgrep` (telescope)
- `go` (gopls and tools)
- `rust` (rust-analyzer and crates)
- `npm` (ts-server and quicktype)
