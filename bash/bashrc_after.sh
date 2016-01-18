# .bashrc extras

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Ignore repeated commands and save lots of history
HISTIGNORE="&:ls:[fb]g:exit"
# Eliminate adjacent history lines
HISTCONTROL=ignoreboth
HISTFILESIZE=
HISTSIZE=
shopt -s histappend

# Clever prompt with nice colouring.  Makes it easier to read.
#c() { echo '\[\033['$1'm\]'; }
#export PS1="$(c 37)\D{%H:%M}$(c 30)[$(c 36)\u@\h \W$(c 0)]\$ "
#unset c
#export PROMPT_COMMAND='history -a;printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
export LP_CACHE_SLOW_CMDS=1
export LP_ENABLE_BATT=0
export LP_ENABLE_TEMP=0
source $script_dir/liquidprompt/liquidprompt

# need this for vim airline
export TERM='xterm-256color'

# make ls colours work properly
alias ls="ls --color=auto"
eval `dircolors $script_dir/dircolors-solarized/dircolors.256dark`

#export LS_COLORS="no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:"

export EDITOR=vimx
alias vi=vimx
alias vim=vimx

