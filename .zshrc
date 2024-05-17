#######
# Exports 

export PATH=$PATH:~/.scripts:~/go/bin:~/.cargo/bin
export EDITOR=nvim
export VISUAL="$EDITOR"
export GITHUB_USER="estevesnp"


#########
# Aliases

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias l='ls -lah --color=auto'
alias vim='nvim'
alias n='nvim .'
alias dot='cd ~/.dotfiles'
alias cfgnvim='cd ~/.config/nvim/lua/esteves/'
alias start-ssh='eval $(ssh-agent -s) && ssh-add'
alias tn='tmux new -s'


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
bindkey '^p' history-search-backward # Search history back for current command
bindkey '^n' history-search-forward  # Search history forward for current command
setopt auto_cd                       # Change to directory without cd
unsetopt nomatch                     # If a glob does not match, return the glob itself

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
autoload -Uz compinit && compinit


##########
# Plugins

source <(fzf --zsh) # fzf key bindings
source ~/.zsh/ls-colors/ls-colors.sh
source ~/.zsh/git-prompt/git-prompt.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_MANUAL_REBIND=""  # Reduces prompt lag from autosuggestions


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
ZSH_THEME_GIT_PROMPT_BEHIND=""
ZSH_THEME_GIT_PROMPT_AHEAD=""
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✘"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}✚"
ZSH_THEME_GIT_PROMPT_STASHED=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

PROMPT='%F{174}%m%f::%F{198}%2~%f $(gitprompt)$ '
