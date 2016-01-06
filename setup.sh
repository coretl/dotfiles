#!/bin/bash

# get the dir of the current script
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

$script_dir/bash/setup_bash.sh
$script_dir/gnome-terminal/setup_gnome_terminal.sh
$script_dir/vim/setup_vim.sh


