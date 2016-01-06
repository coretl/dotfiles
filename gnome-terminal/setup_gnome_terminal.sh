##!/bin/bash

# get the dir of the current script
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# add gnome-terminal settings
gconf_dir=~/.gconf/apps/gnome-terminal

# If we already have a dir and it's not a link, move it out of the way
if [[ -a $gconf_dir && ! -h $gconf_dir ]]; then
    mv $gconf_dir ${gconf_dir}.bak
fi

# Now make the link
if [[ ! -a $gconf_dir ]]; then
    ln -s $script_dir/gnome-terminal $gconf_dir
fi


