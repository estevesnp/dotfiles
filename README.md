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

- zsh
- git
- nvim
- ghostty
- stow
- fzf
- tmux
  - `git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
- zoxide
  - `cargo install --locked zoxide`
- yazi
  - `cargo install --locked yazi-fm yazi-cli`
- tms
  - `cargo install --locked tmux-sessionizer`
  - `tms config --paths path/to/projects`
- bat
  - `bat cache --build`

## dependencies

### nvim

- gcc (tree-sitter)
- xclip (clipboard, check `:h clipboard`)
- fd (telescope)
- ripgrep (telescope)
- go (gopls and tools)
- rust (rust-analyzer)
- npm (ts-server and quicktype)
