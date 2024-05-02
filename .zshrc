#######
# Paths

export PATH=$PATH:~/go/bin


#########
# Aliases

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias l='ls -lah --color=auto'
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

source ~/.zsh-pluggins/ls-colors/ls-colors.sh
source ~/.zsh-pluggins/my-git-prompt/my-git-prompt.sh
source ~/.zsh-pluggins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_MANUAL_REBIND=""  # Reduces prompt lag from autosuggestions
eval "$(fzf --zsh)" # FZF keybindings


########
# Prompt

PROMPT='%F{174}%m%f::%F{198}%2~%f $ '

