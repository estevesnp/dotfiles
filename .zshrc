#######
# Paths

export PATH=$PATH:~/scripts:~/go/bin:~/.cargo/bin


#########
# Aliases

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias l='ls -lah --color=auto'
alias vim='nvim'
alias n='nvim .'
alias cfgnvim='cd ~/.config/nvim/'


################
# History Config

HISTSIZE=5000            # How many lines of history to keep in memory
HISTFILE=~/.zsh_history  # Where to save history to disk
SAVEHIST=5000            # Number of history entries to save to disk
setopt appendhistory     # Append history to the history file (no overwriting)
setopt sharehistory      # Share history across terminals
setopt incappendhistory  # Immediately append to the history file, not just when a term is killed


##########
# Plugins

eval "$(fzf --zsh)" # FZF keybindings
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
