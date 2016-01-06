#!/bin/bash

# get the dir of the current script
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# install vundle
if [[ ! -a ~/.vim/bundle/Vundle.vim ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# link to our vimrc if it doesn't exist
if [[ ! -a ~/.vimrc ]]; then
    ln -s $script_dir/vimrc.vim ~/.vimrc
fi

# install all plugins with Vundle, this will take some time...
vim +PluginInstall +qall

# install youcompleteme if needed
ycm_dir=~/.vim/bundle/YouCompleteMe
if [[ ! -a $ycm_dir/third_party/ycmd/ycm_client_support.so ]]; then
    cd $ycm_dir && ./install.py
fi



