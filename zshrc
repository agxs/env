# zmodload zsh/zprof
# Path to your oh-my-zsh configuration.
DISABLE_AUTO_UPDATE="true"
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME=""

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(sudo git mvn extract safe-paste docker colored-man-pages tmux ng kubectl helm)

source $ZSH/oh-my-zsh.sh

HISTSIZE=10000000
SAVEHIST=10000000
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

unsetopt correct_all

# Better bindings for up/down keys to search history
#if [ `uname` = "Linux" ]
#then
#  bindkey "${terminfo[kcuu1]}" history-beginning-search-backward
#  bindkey "${terminfo[kcud1]}" history-beginning-search-forward
#else
  bindkey '^[[A' history-beginning-search-backward
  bindkey '^[[B' history-beginning-search-forward
#fi

#if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
  #return
#fi

# Fast ctrl-z to re-enter vim
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Customize to your needs...

export EDITOR=vim
export PAGER=less

alias enscript='enscript -2 -G -E -r -j'
alias rm='rm -v'
alias bc='bc -l'
alias cpan='cpanm'
alias parallel='parallel --citation'
alias openssl_verify='openssl s_client -connect'
alias k-unset='unset_k8s_context'
alias k-set='set_k8s_context'
alias k-ns='set_k8s_namespace'
alias d='docker'
alias de='docker exec -it'
alias dl='docker logs -f'
alias dr='docker run -it --rm'
alias dc='docker-compose'
alias -g DS="-o go-template='{{ range \$k, \$v := .data }}{{ \$k }}: {{ \$v | base64decode }}{{ \"\n\" }}{{ end }}'"
alias cat='bat'

unalias gcl
alias gcv='glab ci view'
alias gcl='glab ci list'
alias gcmr='glab mr create -a aseales --fill --fill-commit-body --remove-source-branch'
alias gcmra='glab mr merge'
alias gcmrd='glab mr diff'

alias gsq='git rebase -i $(git merge-base $(git symbolic-ref --short HEAD) master)'

alias sd='skaffold dev --tolerate-failures-until-deadline=true'

alias less='less -RFX'
if [ `uname` != "Darwin" ]
then
  alias ack='ack --color'
  alias ssh='ssh -X'
  alias vless='vim -u /usr/share/vim/vimcurrent/macros/less.vim'
  alias vim='nvim'
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
  alias ack='ack --color'
  alias vless='vim -u /usr/share/vim/vim73/macros/less.vim'
  alias vim='/opt/homebrew/bin/nvim'
  if [[ -f $HOME/.zshrc-secrets ]]; then
    source $HOME/.zshrc-secrets
  fi
  alias top='top -o cpu'
  alias chrome-debug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222'
  alias beep='echo -en "\007"'
  export JAVA_HOME=`/usr/libexec/java_home -v 17`
  export LSCOLORS=exgxbxdxcxegedabagacad
fi
export EDITOR=nvim
export LS_COLORS='rs=0:di=34:ln=36:mh=00:pi=33:so=35:do=35:bd=33:cd=33:or=31:su=37:sg=30:ca=30:tw=30:ow=34:st=37:ex=32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';

eval "$(starship init zsh)"

# Kubernetes namespace autocomplete
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

# A cross-platform way to open a file or URL
function xopen() {
    item=$1
    [[ -z "$item" ]] && echo "Usage: open <file or URL>" >&2 && return 1
    if uname -r | grep -qi microsoft; then
        powershell.exe -NoProfile -Command "Start-Process '$item'"
    elif command -v xdg-open >/dev/null 2>&1; then
        xdg-open "$item"
    elif [ -e "$(which open)" ]; then
        \open "$item"
    else
        echo "No suitable command found to open $item" >&2
        return 1
    fi
}

export BAT_THEME=DarkNeon

export DOCKER_BUILDKIT=1

export PATH=$PATH:$HOME/src/env/bin
# Set ZSH tab complete colours to be the same as ls
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ ! -f ~/.fzf.zsh && -x "$(command -v fzf)" ]] && source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

if [ -e "/opt/homebrew/bin/mise" ]; then
  eval "$(/opt/homebrew/bin/mise activate zsh)"
fi
if [ -e "/usr/bin/mise" ]; then
  eval "$(/usr/bin/mise activate zsh)"
fi

if [ -e "$HOME/.acme.sh" ]; then
  . "/Users/aseales/.acme.sh/acme.sh.env"
fi

if [ -e "$HOME/.config/glab-cli" ]; then
  eval "$(glab completion -s zsh)"
fi

# zprof

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf-git.sh/fzf-git.sh ] && source ~/.fzf-git.sh/fzf-git.sh

export PATH=/opt/homebrew/opt/postgresql@15/bin:$PATH

