"""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""

syntax on
filetype off

" Sets how many lines of history VIM has to remember
set history=700

" Autoreads external file changes
set autoread
set mouse=a
set showcmd

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>x :x<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""
" UI
"""""""""""""""""""""""""""
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'morhetz/gruvbox'
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
call vundle#end()
filetype plugin indent on

colorscheme gruvbox
set t_Co=256

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

set grepprg=grep\ -nH\ $

set autoindent
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2

if has('mouse')
  set mouse=a
endif

set number

set ignorecase
set smartcase

set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1

" Linebreak on 500 characters
set lbr
set tw=500

inoremap jj <Esc>
nnoremap JJJJ <Nop>

set incsearch

set nohidden
nnoremap ; :
nnoremap : ;

set hlsearch
""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?


" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>



"htmlheader plugin 
autocmd BufNewFile *.html,*.htm,*.php source ~/.vim/ftplugin/htmltemplate.vim

" PEP8
"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

"au BufNewFile,BufRead *.js, *.html, *.css, *.php
 "   \ set tabstop=2
  "  \ set softtabstop=2
   " \ set shiftwidth=2

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
