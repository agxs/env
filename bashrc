parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\s*\(.*\)/ (\1)/'
}

PS1='${debian_chroot:+($debian_chroot)}\[\033[00;32m\]\u@\h\[\033[00m\] \[\033[00;34m\]\W\[\033[00;31m\]$(parse_git_branch)\[\033[00;34m\] \$ \[\033[00m\]'

export EDITOR=vim

alias ispell='ispell -d british'
alias xterm='xterm -bg black -fg grey'
alias Eterm='Eterm --font-fx=none --cmod=90 --buttonbar=no --scrollbar=no'
alias enscript='enscript -2 -G -E -r -j'
alias grep='grep --color=auto'
alias egrep='grep --color=auto'
alias cgrep='grep --color=always'
alias rm='rm -v'
alias ssh='ssh -X'
alias lui='rdesktop -g 1024x768 -u aseales -d ed -p - lui.edina.ac.uk'
alias assynt1='rdesktop -g 1024x768 -u aseales -d ed -p - assynt1.edina.ac.uk'
alias assynt2='rdesktop -g 1024x768 -u aseales -d ed -p - assynt2.edina.ac.uk'
alias assynt3='rdesktop -g 1024x768 -u aseales -d ed -p - assynt3.edina.ac.uk'
alias culmor1='rdesktop -g 1024x768 -u aseales -d ed -p - culmor1-at.edina.ac.uk'
alias culmor2='rdesktop -g 1024x768 -u aseales -d ed -p - culmor2-at.edina.ac.uk'

export LESS=-R
export HISTSIZE=100000
export HISTFILESIZE=100000
export GREP_COLOR='00;38;32;157'

export PATH=$HOME/bin:$PATH

OS=`uname`
DLIBBAUER=129.215.169.64
AWK=nawk
MYIP=`echo $SSH_CLIENT | $AWK '{ print $1 }'`
if [ "$OS" = "SunOS" -a "$MYIP" = "$DLIBBAUER" ]; then
  export TERM=xtermc
fi

