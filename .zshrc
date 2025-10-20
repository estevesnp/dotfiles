PRE_ZSHRC_INIT="$HOME/.zshrc_pre_init"
POST_ZSHRC_INIT="$HOME/.zshrc_post_init"

# run pre .zshrc init script if it exists
[[ -f "$PRE_ZSHRC_INIT" ]] && source "$PRE_ZSHRC_INIT"

#########
# Exports 

export EDITOR=nvim
export VISUAL="$EDITOR"
export GOPATH=$HOME/.go
export PATH=$PATH:$HOME/bin:$HOME/.local/bin:$GOPATH/bin:$HOME/.cargo/bin
export MANPAGER='less -R --use-color -Dd+r -Du+b'
export BAT_THEME='rose-pine'


#######################
# Aliases and Functions

# general
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias l='ls -lah --color=auto'
alias grep='grep --color=auto'
alias c='clear'
alias m='make'
alias dot='cd ~/.dotfiles/'
alias dotnv='cd ~/.config/nvim/'

csd() {
    local cspath
    cspath=$(cs --print "$1") || return
    [ -n "$cspath" ] || return
    builtin cd -- "$cspath" || return
}

cf() {
  local dir
  dir=$(fzf --reverse --header="cd to file's dir" | xargs dirname) || return
  cd "$dir" || return
}

# neovim
alias _vim='\vim'
alias vim='nvim'
alias cvim='nvim -u NORC'
alias n='nvim .'

fn() {
  local query_flag="--query=$1"

  local preview_cmd="cat {}"
  if command -v bat &> /dev/null; then
    preview_cmd="bat --color=always {}"
  fi

  local file
  file=$(fzf --reverse --header='open in nvim' --preview="$preview_cmd" "$query_flag")
  [[ -n $file ]] && nvim "$file"
}

# git

HASH="%C(always,yellow)%h%C(always,reset)"
RELATIVE_TIME="%C(always,green)%ar%C(always,reset)"
AUTHOR="%C(always,bold blue)%an%C(always,reset)"
REFS="%C(always,red)%d%C(always,reset)"
SUBJECT="%s"

FORMAT="$HASH $RELATIVE_TIME{$AUTHOR{$REFS $SUBJECT"

formatted_git_log() {
  git log --graph --pretty="tformat:$FORMAT" $* |
  column -t -s '{' |
  less -XRS --quit-if-one-screen
}

alias gs='git status'
alias gss='git status --short'
alias ga='git add'
alias gaa='git add -A'
alias gap='git add --patch'
alias ga3='git apply --3way'
alias gc='git commit --verbose'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gce='git commit --amend --no-edit'
alias gclean='git clean -df'
alias gclone='git clone --depth1'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdw='git diff --word-diff'
alias gr='git restore'
alias grs='git restore --staged'
alias gl='formatted_git_log'
alias glog='git log'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpb='git push -u origin $(git branch --show-current)'
alias gpl='git pull'
alias gpr='git rebase'
alias grl='git reflog --date=iso'
alias gb='git blame -C -C -C'
alias cdr='cd $(git rev-parse --show-toplevel)' # cd to git root
alias co='git checkout' # [c]heck [o]ut

fo() {                  # [f]uzzy check[o]ut
  local branch
  branch=$(git branch --no-color --sort=-committerdate --format='%(refname:short)' | fzf --reverse --header 'git checkout') || return
  [ -n "$branch" ] && git checkout "$branch"
}

po() {                  # [p]ull request check[o]ut
  if ! command -v gh &> /dev/null; then
    echo "gh not found in PATH, exiting"
    return 1
  fi

  local branch
  branch=$(gh pr list | fzf --reverse --header 'checkout PR' | awk '{print $(NF-2)}') || return
  [ -n "$branch" ] && git checkout "$branch"
}

mpo() {                  # [m]y [p]ull request check[o]ut
  if ! command -v gh &> /dev/null; then
    echo "gh not found in PATH, exiting"
    return 1
  fi

  local branch
  branch=$(gh pr list --author "@me" | fzf --reverse --header 'checkout my PR' | awk '{print $(NF-2)}') || return
  [ -n "$branch" ] && git checkout "$branch"
}

ghcl() {                 # [g]it[h]ub [cl]one
  if ! command -v gh &> /dev/null; then
    echo "gh not found in PATH, exiting"
    return 1
  fi

  local repo
  repo=$(gh repo ls --json name,visibility,pushedAt --template '{{range .}}{{tablerow .name .visibility .pushedAt}}{{end}}' |\
    fzf --reverse --header 'clone a repo' |\
    awk '{print $1}') || return
  [ -n "$repo" ] && gh repo clone "$repo"
}

# tmux
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias tls='tmux ls'
alias tkill='tmux kill-server'

function ft() {
  local sessions
  if ! sessions=$(tmux ls 2>/dev/null); then
    echo "no tmux sessions found, exiting"
    return 1
  fi

  local session
  session=$(fzf --reverse --header 'attach to tmux session' <<< "$sessions" | cut -d: -f1) || return
  [[ -n $session ]] && tmux attach -t "$session"
}

# yazi
function y() {
  local tmp
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# zig
alias zb='zig build'
alias zbr='zig build run'
alias zbt='zig build test'
alias zbp='zig build -p ~/.local'

# go
alias golint='golangci-lint run'

# python
alias venv-init='python3 -m venv .venv'
alias venv-install='pip install -r requirements.txt'
alias activate='source .venv/bin/activate'

# k8s
alias k='kubectl'

# misc
alias init-ssh='eval $(ssh-agent -s) && ssh-add'
alias bzf='fzf --reverse --preview="bat --color=always {}"'
alias dv='dirs -v'
alias e='echo "exit code: $?"'


#########
# History

HISTSIZE=5000                # How many lines of history to keep in memory
HISTFILE=~/.zsh_history      # Where to save history to disk
SAVEHIST=5000                # Number of history entries to save to disk
HISTDUP=erase                # Erase duplicates in the history file
setopt appendhistory         # Append history to the history file (no overwriting)
setopt sharehistory          # Share history across terminals
setopt hist_ignore_space     # Ignore commands that start with a space
setopt hist_ignore_all_dups  # Ignore duplication command history line
setopt hist_save_no_dups     # Don't save duplicated commands
setopt hist_ignore_dups      # Ignore duplicated commands
setopt hist_find_no_dups     # Don't display duplicates when searching history
setopt incappendhistory      # Immediately append to the history file, not just when a term is killed


######
# Misc

bindkey -e                           # Use emacs key bindings
bindkey "^[[3~" delete-char          # Delete key
bindkey '^p' history-search-backward # Search history back for current command
bindkey '^n' history-search-forward  # Search history forward for current command
setopt auto_cd                       # Change to directory without cd
unsetopt nomatch                     # If a glob does not match, return the glob itself

# See last dirs with `dirs -v`
setopt AUTO_PUSHD
export DIRSTACKSIZE=20

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
autoload -Uz compinit && compinit


#########
# Plugins

source ~/.zsh/LS_COLORS/lscolors.sh
source ~/.zsh/git-prompt.zsh/git-prompt.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_MANUAL_REBIND=""  # Reduces prompt lag from autosuggestions

# fzf
if command -v fzf &> /dev/null; then
    source <(fzf --zsh)
fi

# zoxide
if command -v zoxide &> /dev/null; then
    source <(zoxide init zsh --cmd cd)
fi


########
# Prompt

ZSH_GIT_PROMPT_SHOW_UPSTREAM="no"
ZSH_GIT_PROMPT_SHOW_TRACKING_COUNTS=0
ZSH_GIT_PROMPT_SHOW_LOCAL_COUNTS=0

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_SEPARATOR="%f|"
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[cyan]%}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL=""
ZSH_THEME_GIT_PROMPT_UPSTREAM_NO_TRACKING=""
ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX=""
ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX=""
ZSH_THEME_GIT_PROMPT_BEHIND="↓"
ZSH_THEME_GIT_PROMPT_AHEAD="↑"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}?"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✘"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}✚"
ZSH_THEME_GIT_PROMPT_STASHED=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

PROMPT='%F{174}%m%f::%F{198}%2~%f $(gitprompt)$ '

# run post .zshrc init script if it exists
[[ -f "$POST_ZSHRC_INIT" ]] && source "$POST_ZSHRC_INIT"
