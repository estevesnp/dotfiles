git_user_prompt() {
  # depends on woefe/git-prompt.zsh for this variable for prompt performance
  [[ -n "${_ZSH_GIT_PROMPT_STATUS_OUTPUT-}" ]] || return 0

  local email name
  email=$(GIT_OPTIONAL_LOCKS=0 git config user.email 2> /dev/null) || return 0
  name=$(GIT_OPTIONAL_LOCKS=0 git config user.name 2> /dev/null) || return 0

  [[ -z "$email$name" ]] && return 0

  echo "%{$fg[cyan]%}$name%{$reset_color%} <%{$fg[cyan]%}$email%{$reset_color%}>"
}
