# ZSH Theme
# Based on bira theme
# Based on gnzh

setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%F{green}%n%f'
  PR_USER_OP='%F{green}%#%f'
  PR_PROMPT='%f➤ %f'
else # root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}➤ %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%m%f' # SSH
else
  PR_HOST='%F{green}%m%f' # no SSH
fi


local return_code="%(?..%F{red}%? ↵%f)"

local user_host="${PR_USER}%F{cyan}@${PR_HOST}"
local current_dir="%B%F{blue}%~%f%b"
local git_branch='$(git_prompt_info)'

function k8s_prompt_info() {
  if [[ -f "$HOME/.kube/current-context" ]]; then
    local context=$(cat $HOME/.kube/current-context)
    if [[ ! -z "$context" ]]; then
      echo " %F{red}‹%F{white}\xE2\x8E\x88 %F{red}$context›%f"
    fi
  fi
}

local k8s_context='$(k8s_prompt_info)'

PROMPT="╭─${user_host} ${current_dir}${k8s_context} ${git_branch}
╰─$PR_PROMPT "
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{yellow}›%f"

ZSH_THEME_GIT_PROMPT_DIRTY=" %F{009}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{green}✔"
ZSH_THEME_GIT_PROMPT_STASH="%F{009}◎"
}

function _kn() {
    local cur prev opts
    case "$COMP_CWORD" in
        1)
            opts="$(kubectl config get-contexts -o name 2>/dev/null)"
            ;;
        2)
            prev="${COMP_WORDS[COMP_CWORD-1]}"
            [[ "$prev" = "." ]] && prev=$(kubectl config current-context)
            [[ "$prev" = "-" ]] && return
            if kubectl config get-contexts -o name | grep -q "^${prev}\$"
            then
                opts=$(kubectl --context=$prev get namespaces -o go-template --template='{{range .items}}{{.metadata.name}} {{end}}')
            fi
            ;;
        *)
            return
            ;;
    esac
    COMPREPLY=($(compgen -W "${opts}" -- ${COMP_WORDS[COMP_CWORD]}))
    return 0
}

autoload bashcompinit && bashcompinit
complete -F _kn set_k8s_context

