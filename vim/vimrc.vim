" preamble
""""""""""
set nocompatible

" Needed for vundle, will be turned on after vundle inits
filetype off

" Setup vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle configuration
""""""""""""""""""""""

" These need to come before the configuration options for the plugins since
" vundle will add the plugin folders to the runtimepath only after it has seen
" the plugin's Plugin command.

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'hynek/vim-python-pep8-indent'

call vundle#end()

" reset vimrc augroup
"""""""""""""""""""""

" We reset the vimrc augroup. Autocommands are added to this group throughout
" the file
augroup vimrc
  autocmd!
augroup END

" turn on filetype plugins
""""""""""""""""""""""""""

" Enable detection, plugins and indenting in one step
" This needs to come AFTER the Plugin commands!
filetype plugin indent on

" Indents
"""""""""

" Makefiles
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

" Everything else
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

" Display
"""""""""

" Show tabs and trailing spaces.
" Ctrl-K >> for » , Ctrl-K << for « , Ctrl-K .M for · , Ctrl-K Cu for ¤
" Ctrl-K DG for ° , Ctrl-K 'm for ¯ (use :dig for list of digraphs)
set list listchars=tab:»¯,trail:°,extends:»,precedes:«

" When working with wrapped lines (:set wrap) configure line wrap char:
set showbreak=···

" Highlight for trailing whitespace
highlight SpecialKey cterm=none ctermfg=DarkRed

" Plugin-Specific Settings
""""""""""""""""""""""""""

" altercation/vim-colors-solarized settings
" """""""""""""""""""""""""""""""""""""""""

" Toggle this to "light" for light colorscheme
set background=light

" Uncomment the next line if your terminal is not configured for solarized
" let g:solarized_termcolors=256

" Set the colorscheme
colorscheme solarized

" bling/vim-airline settings
" """"""""""""""""""""""""""

" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" General settings
""""""""""""""""""

set hidden              " Allow switching buffers without writing to disk
set backspace=indent,eol,start " Make backspace delete over line breaks
set ruler
set showcmd
set incsearch
set hlsearch

" With this on, need to press shift before pasting from middle click
set mouse=a

syntax on

" By default, Vim will not use the system clipboard when yanking/pasting to
" the default register. This option makes Vim use the system default
" clipboard.
" Note that on X11, there are _two_ system clipboards: the "standard" one, and
" the selection/mouse-middle-click one. Vim sees the standard one as register
" '+' (and this option makes Vim use it by default) and the selection one as
" '*'.
" See :h 'clipboard' for details.
set clipboard=unnamed


" Fuzzy finder
set rtp+=~/.fzf

" Home away from home. We store some config files and snippets here and the
" whole dotfiles dir is a git repo. Should be the last entry in rtp (for
" UltiSnips).
set rtp+=$HOME/dotfiles/vim


