AS_IP=`echo $SSH_CLIENT | cut -d ' ' -f1`
DLIBBAUER=129.215.169.64
OS=`uname`
if [ "$OS" != "SunOS" -o "$AS_IP" == "$DLIBBAUER" ] ; then

  parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\s*\(.*\)/ (\1)/'
  }

  export EDITOR=vim

  alias enscript='enscript -2 -G -E -r -j'
  alias grep='grep --color=auto'
  alias egrep='grep --color=auto'
  alias cgrep='grep --color=always'
  alias rm='rm -v'
  alias ssh='ssh -X'

  export LESS=-R
  export HISTSIZE=100000
  export HISTFILESIZE=100000
  export GREP_COLOR='00;38;32;157'

  export LS_COLORS='rs=0:di=34:ln=36:mh=00:pi=33:so=35:do=35:bd=33:cd=33:or=31:su=37:sg=30:ca=30:tw=30:ow=34:st=37:ex=32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';

  export ACK_COLOR_match=green

  export PATH=$HOME/bin:$PATH

  export TERM=xterm-256color

  HOSTNAME_COLOUR=""
  if [ "$OS" = "SunOS" ]; then
    unalias rm # cause Solaris is weak
    unalias grep
    alias grep='ggrep --color=auto' # super weak
    alias ls='ls -F'
    export TERM=xtermc
    HOSTNAME_COLOUR='\[\033[00;31m\]'
  fi

  PS1='${debian_chroot:+($debian_chroot)}\[\033[00;32m\]\u@'${HOSTNAME_COLOUR}'\h\[\033[00m\] \[\033[00;34m\]\W\[\033[00;31m\]$(parse_git_branch)\[\033[00;34m\] \$ \[\033[00m\]'

fi
