# https://github.com/agnoster zsh theme
# Slightly modified by agxs

ZSH_THEME_GIT_PROMPT_DIRTY='±'

function _git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
  echo "${ref/refs\/heads\//⭠ }$(parse_git_dirty)"
}

function _git_info() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    local BG_COLOR=green
    if [[ -n $(parse_git_dirty) ]]; then
      BG_COLOR=yellow
    fi
    echo "%{%K{$BG_COLOR}%}⮀%{%F{black}%} $(_git_prompt_info) %{%F{$BG_COLOR}%K{blue}%}⮀"
  else
    echo "%{%K{blue}%}⮀"
  fi
}

#function _vagrant_info() {
  #local STATE=$(vagrant_state)
  #if [[ -n $STATE ]]; then
    #local BG_COLOR
    #local TEXT
    #if [[ $STATE = "running" ]]; then
      #BG_COLOR=green
      #TEXT="VM Up"
    #elif [[ $STATE = "poweroff" ]]; then
      #BG_COLOR=yellow
      #TEXT="VM Down"
    #elif [[ $STATE = "not" ]]; then
      #BG_COLOR="red"
      #TEXT="VM Not Created"
    #elif [[ $STATE = "aborted" ]]; then
      #BG_COLOR="red"
      #TEXT="VM Aborted"
    #fi
    #echo "%{%K{$BG_COLOR}%}⮀%{%F{black}%} $TEXT %{%F{$BG_COLOR}%K{blue}%}"
  #fi
#}

PROMPT_HOST='%{%b%F{gray}%K{black}%} %(?.%{%F{green}%}✔.%{%F{red}%}✘)%{%F{gray}%} %n@%m %{%F{black}%}'
PROMPT_DIR='%{%F{white}%} %1~ '
PROMPT_SU='%(!.%{%k%F{blue}%K{black}%}⮀%{%F{yellow}%} ⚡ %{%k%F{black}%}.%{%k%F{blue}%})⮀%{%f%k%b%}'

#$PROMPT_HOST$(_vagrant_info)$(_git_info)$PROMPT_DIR$PROMPT_SU '

PROMPT='%{%f%b%k%}
$PROMPT_HOST$(_git_info)$PROMPT_DIR$PROMPT_SU '
