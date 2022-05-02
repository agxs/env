# zmodload zsh/zprof
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agxs2"

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
plugins=(sudo git mvn extract safe-paste docker colored-man-pages tmux ng kubectl)

source $ZSH/oh-my-zsh.sh

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

export TERM=xterm-256color
export EDITOR=vim
export PAGER=less

alias enscript='enscript -2 -G -E -r -j'
alias rm='rm -v'
alias lui="rdesktop -g 1024x768 -u $USER -d ed -p - lui.edina.ac.uk"
alias assynt1="rdesktop -g 1024x768 -u $USER -d ed -p - assynt1.edina.ac.uk"
alias assynt2="rdesktop -g 1024x768 -u $USER -d ed -p - assynt2.edina.ac.uk"
alias assynt3="rdesktop -g 1024x768 -u $USER -d ed -p - assynt3.edina.ac.uk"
alias culmor1="rdesktop -g 1024x768 -u $USER -d ed -p - culmor1-at.edina.ac.uk"
alias culmor2="rdesktop -g 1024x768 -u $USER -d ed -p - culmor2-at.edina.ac.uk"
alias bc='bc -l'
alias cpan='cpanm'
alias irssi='TERM=screen-256color irssi'
alias parallel='parallel --citation'
alias openssl_verify='openssl s_client -connect'
alias k-unset='unset_k8s_context'
alias k-set='set_k8s_context'
alias d='docker'
alias de='docker exec -it'
alias dl='docker logs -f'
alias dr='docker run -it --rm'
alias dc='docker-compose'

alias less='less -RFX'
if [ `uname` != "Darwin" ]
then
  alias ack='ack --color'
  alias ssh='ssh -X'
  alias vless='vim -u /usr/share/vim/vimcurrent/macros/less.vim'
else
  alias ack='ack --color'
  alias vless='vim -u /usr/share/vim/vim73/macros/less.vim'
  alias krb='kinit --kdc-hostname=EASE.ED.AC.UK aseales@EASE.ED.AC.UK'
  alias top='top -o cpu'
  alias chrome-debug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222'
  export JAVA_HOME=`/usr/libexec/java_home -v 17`
  export LSCOLORS=exgxbxdxcxegedabagacad
fi
export LS_COLORS='rs=0:di=34:ln=36:mh=00:pi=33:so=35:do=35:bd=33:cd=33:or=31:su=37:sg=30:ca=30:tw=30:ow=34:st=37:ex=32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';

export BAT_THEME=OneHalfDark

export DOCKER_BUILDKIT=1

export PATH=$PATH:$HOME/src/env/bin
# Set ZSH tab complete colours to be the same as ls
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

export PATH=$HOME/.ndenv/bin:$HOME/src/env/bin:$PATH
type ndenv >/dev/null 2>&1 && eval "$(ndenv init -)"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# zprof
