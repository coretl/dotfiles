#!/bin/bash

# get the dir of the current script
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# we flip the return value for grep because it returns 0 on pattern found;
# also, grep's -q and -s options aren't portable, so we can't use them
file_found=$( ! grep bashrc_after.sh ~/.bashrc > /dev/null 2>&1 ; echo $?)

# add bashrc_after to bashrc if it's not there already
if [[ ! -f ~/.bashrc || !$file_found ]]; then
    echo "source $script_dir/bashrc_after.sh" >> ~/.bashrc
fi

# add fonts
mkdir -p ~/.fonts
cp $script_dir/powerline-fonts/UbuntuMono/Ubu* ~/.fonts
fc-cache -vf ~/.fonts

