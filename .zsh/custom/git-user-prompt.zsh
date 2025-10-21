# display the current git user's email and name, usually used with RPROMPT
#
# settings:
#
#   ZSH_GIT_USER_PROMPT_USE_WOEFE
#     set to 1 if using woefe/git-prompt.zsh, for improved prompt performance
#
#   ZSH_GIT_USER_PROMPT_DEFAULT_EMAIL
#     set to a default email. if the current email is the same, the color is set to green, else it's red
#
#   ZSH_GIT_USER_PROMPT_DEFAULT_NAME
#     set to a default name. if the current name is the same, the color is set to green, else it's red
#
git_user_prompt() {
  if (( ZSH_GIT_USER_PROMPT_USE_WOEFE )); then
    [[ -n "$_ZSH_GIT_PROMPT_STATUS_OUTPUT" ]] || return 0
  else
    git rev-parse --is-inside-work-tree > /dev/null 2>&1 || return 0
  fi

  local email name
  email=$(GIT_OPTIONAL_LOCKS=0 git config user.email 2> /dev/null) || return 0
  name=$(GIT_OPTIONAL_LOCKS=0 git config user.name 2> /dev/null) || return 0

  [[ -z "$email$name" ]] && return 0

  local emailcolor namecolor
  emailcolor=cyan
  namecolor=cyan

  if [[ -n "$ZSH_GIT_USER_PROMPT_DEFAULT_EMAIL" ]]; then
    if [[ "$email" == "$ZSH_GIT_USER_PROMPT_DEFAULT_EMAIL" ]]; then
      emailcolor=green
    else
      emailcolor=red
    fi
  fi

  if [[ -n "$ZSH_GIT_USER_PROMPT_DEFAULT_NAME" ]]; then
    if [[ "$name" == "$ZSH_GIT_USER_PROMPT_DEFAULT_NAME" ]]; then
      namecolor=green
    else
      namecolor=red
    fi
  fi

  echo "%{$fg[$namecolor]%}$name%{$reset_color%} <%{$fg[$emailcolor]%}$email%{$reset_color%}>"
}
