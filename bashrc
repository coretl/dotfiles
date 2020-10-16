# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# for opening beamline synoptics
for x in $(seq -f '%02g' 24); do
    for i in I J K B C D; do
        alias ${i}${x}='$(configure-ioc s -p 'BL${x}${i}'-gui) -d'
        alias ${i}${x}w='/dls_sw/work/$DLS_EPICS_RELEASE/ioc/BL'${x}${i}'/BL/bin/linux-x86*/st'BL${x}${i}'-gui -d'
    done
done

# for doing make
alias makej='make -j 4 || echo ***Error $?'

# need this to avoid "Warning: Missing charsets in String to FontSet conversion" messages
#export LC_ALL=C

alias start-ssh-agent='eval $(ssh-agent); ssh-add'
alias works='gnome-terminal --working-directory=/dls_sw/work/R3.14.12.3/support --profile=work'
alias prods='gnome-terminal --working-directory=/dls_sw/prod/R3.14.12.3/support --profile=prod'
alias worki='gnome-terminal --working-directory=/dls_sw/work/R3.14.12.3/ioc --profile=work'
alias prodi='gnome-terminal --working-directory=/dls_sw/prod/R3.14.12.3/ioc --profile=prod'
alias workp='gnome-terminal --working-directory=/dls_sw/work/common/python --profile=work'
alias prodp='gnome-terminal --working-directory=/dls_sw/prod/common/python/RHEL6-x86_64 --profile=prod'
alias workt='gnome-terminal --working-directory=/dls_sw/work/tools/RHEL6-x86_64 --profile=work'
alias prodt='gnome-terminal --working-directory=/dls_sw/prod/tools/RHEL6-x86_64 --profile=prod'
alias set-tmux-display='for name in `tmux ls -F "#{session_name}"`; do tmux setenv -g -t $name DISPLAY $DISPLAY; done'

function isword() { echo "$1" | aspell -a ;}
function .ssh() { pwd > ~/.ssh_pwd && gnome-terminal --profile=remote -e "ssh -o StrictHostKeyChecking=no -Y $1" ;}
function .console() { gnome-terminal --profile=ioc -t "$1" -e "$(which console) $1" ;}
alias mailattachment="echo | mutt -s File tom.cobb@diamond.ac.uk -a "

source /home/tmc43/.git-completion1.7.1.bash
[ -d /dls_sw/prod/tools ] && source $(/dls_sw/prod/tools/RHEL$(/usr/bin/lsb_release -sr | cut -d. -f1)-x86_64/defaults/bin/configure-tool s -p dcs-autocomp)/prefix/bin/.dcs_complete_console.sh

# Autocomplete hosts
complete -W "$(host -l diamond.ac.uk | cut -f 1 -d ' ')" ssh sshh ping

# ssh and don't moan
alias sshh='ssh -X -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

source /home/tmc43/dotfiles/bash/bashrc_after.sh

# added by travis gem
[ -f /home/tmc43/.travis/travis.sh ] && source /home/tmc43/.travis/travis.sh
