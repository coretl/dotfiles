" Some sources for settings and documentation:
"   http://0xfe.blogspot.com/2010/04/digraphs-in-vim.html
"   http://www.pixelbeat.org/settings/.vimrc
" Other interesting vimrc files:
"   http://www.slackorama.com/projects/vim/vimrc.html
"   http://www.pixelbeat.org/settings/.vimrc
" See also:
"   http://rayninfo.co.uk/vimtips.html      Long list of helpful looking tips

" Show tabs and trailing spaces.
" Ctrl-K >> for » , Ctrl-K << for « , Ctrl-K .M for · , Ctrl-K Cu for ¤
" Ctrl-K DG for ° , Ctrl-K 'm for ¯ (use :dig for list of digraphs)
set list listchars=tab:»¯,trail:°,extends:»,precedes:«
" When working with wrapped lines (:set wrap) configure line wrap char:
set showbreak=···

" Colour settings
" Can use :colorscheme to set a specific colour scheme
set background=dark     " Needed for dark background terminals
map <F12> :set background=light<CR>
syntax on

highlight SpecialKey ctermfg=Red
highlight Ignore     ctermfg=Grey
highlight NonText    ctermfg=DarkRed

" General display settings
set hidden              " Allow switching buffers without writing to disk
set ruler               " Always show cursor position
set title               " Set terminal title to filename
set laststatus=2        " Always show status line
set incsearch           " Incremental search
set wrap                " Show wrapped lines by default

" set wildchar=<Tab> wildmenu wildmode=longest,full
set wildchar=<Tab> wildmenu wildmode=longest,list:full

" Tab control
set tabstop=8           " Display hard tabs on 8 space stops
set softtabstop=4       " Treat <Tab> key as four spaces
set shiftwidth=4        " Amount indentation changes on indent commands
set expandtab           " Convert tabs to spaces on insertion
set smarttab            "
"set textwidth=80

" Highlight long lines
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Intentation control:
"   l1      Indent after label
"   g0      No indent on C++ scope labels
"   (s      Seems the best we can do for parenthesis handling
set cinoptions=l1,g0,(s

set scrolloff=5         " Don't scroll right to top of screen
set hlsearch            " Enable search highlighting by default

set numberwidth=6       " If :set number is on.

" Miscellaneous stuff
set nostartofline       " Keep cursor position when switching buffers
set titleold=Terminal   " Disable silly window title on exit

" Comment and uncomment commands.
" When I know what I'm doing, make language dependent
" command -range Comment :<line1>,<line2>s/^/# /
" command -range UnComment :<line1>,<line2>s/^# //
" Possibly a better way to do this.
map ,# :s/^/# /<CR>:nohlsearch<CR>
map ,/ :s:^:// :<CR>:nohlsearch<CR>
map ," :s/^/" /<CR>:nohlsearch<CR>
map ,% :s/^/% /<CR>:nohlsearch<CR>
map ,- :s/^/-- /<CR>:nohlsearch<CR>
map ,<Space> :s:^\(#\\|//\\|"\\|%\\|--\) ::<CR>:nohlsearch<CR>
noremap ,, ,

" Commands for calling grep, derived from
"   http://vim.wikia.com/wiki/Search_for_current_word_in_multiple_files
:nnoremap gr :vimgrep <cword> *<CR>
:nnoremap gR :vimgrep '\b<cword>\b' *<CR>


" :set paste mode is very useful when pasting stuff, for example with mouse
" middle click, but isn't wanted otherwise.  This keystroke toggles paste mode
" and tells us what mode we're in.
map ,p :set invpaste<bar>set paste?<cr>

" The built-in gs (sleep command) is pretty useless, so replace with command
" to visually select the last pasted area.
map gs `[v`]
" A very ingenious function to convert a visual highlight into a search.
" From http://www.rayninfo.co.uk/vimtips.html
vmap / y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" Shortcuts for window control.
map + <C-W>+
map - <C-W>-
map <C-J> <C-W>j
map <C-K> <C-W>k
set noequalalways          " Don't mess with other windows when splitting

" Quick shortcut to get rid of search highlight
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
imap <C-L> <ESC>
vmap <C-L> <ESC>

" Some remaps to break up undo during line insertion.  Suggestions from:
"   http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
"   http://vim.wikia.com/wiki/VimTip1054
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

filetype plugin indent on
" autocmd FileType python

let g:is_posix=1            " Enables non sh file extension colouring


" Work relative to current file
autocmd BufEnter * :lcd %:p:h

" Don't use current directory for swap files, it's seriously annoying!
set directory-=.

" Nice trick to disable auto indenting when it's being stupid
" Taken from: http://vim.wikia.com/wiki/How_to_stop_auto_indenting
:nnoremap <F8> :setl noai nocin nosi inde=<CR>

" Spell checking: enable with :set spell
:set spelllang=en_gb
