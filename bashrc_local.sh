script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

export EDITOR=vim

# Aliases
alias start-ssh-agent='eval $(ssh-agent); ssh-add'
alias mailattachment="echo | mutt -s File tom.cobb@diamond.ac.uk -a "
alias sshh='ssh -X -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias ls="ls --color=auto"

# Store run time in .bash_history history
HISTTIMEFORMAT="[%F %T] "
# Collect very long history, disk space is cheap
HISTSIZE=10000000
HISTFILESIZE=10000000
# Append each command to history, don't overwrite
shopt -s histappend
# Append each command to history immediately after it ran, dont' wait until the session ends
PROMPT_COMMAND="history -a; history -c; history -r;$PROMPT_COMMAND"
# Eliminate adjacent history lines
HISTCONTROL=ignoreboth

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ${script_dir}/liquidprompt/liquidprompt

