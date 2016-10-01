set nocompatible

"" VUNDLE
let vundle_autoinstall = 0
let vundle_readme = expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
echo "Installing Vundle..."
echo ""
silent !mkdir -p ~/.vim/bundle
silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
let vundle_autoinstall = 1
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'

Plugin 'ervandew/supertab'
Plugin 'sheerun/vim-polyglot'
Plugin 'bling/vim-airline'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'gnupg'

call vundle#end()
filetype plugin indent on

syntax on
set grepprg=grep\ -nH\ $*

set laststatus=2
set ruler
set showcmd
set wildmenu

set splitbelow
set splitright

set smartindent
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2

set relativenumber
set number

set ignorecase
set smartcase
set incsearch

set hidden

set timeoutlen=1000 ttimeoutlen=0
set noerrorbells
set visualbell t_vb=

set mouse=a

inoremap jj <Esc>
nnoremap ; :
nnoremap : ;

execute pathogen#infect()
Helptags

colorscheme gruvbox
let mapleader=' '
set background=dark

autocmd BufWritePre * :%s/\s\+$//e

nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>h :windo wincmd K<CR>
nnoremap <Leader>r :CtrlPMRUFiles<CR>
nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <Leader>u :GundoToggle<CR>
nnoremap <Leader>v :windo wincmd H<CR>
nnoremap <Leader>W :%s/\v[[:blank:]]+$//<CR>


if vundle_autoinstall
  echo "Installing bundles..."
  echo ""
  :PluginInstall
endif
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_close_button = 0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = 'λ'
let g:airline_symbols.branch = 'β'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.readonly = 'Δ'
let g:airline_symbols.whitespace = 'ω'

let g:ctrlp_arg_map = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(gif|jpg|pdf|png|pyc|so)$'
\}
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_open_multiple_files = 'i'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'

let g:gundo_close_on_revert = 1
let g:gundo_preview_bottom = 1
let g:gundo_right = 1

let g:ycm_autoclose_preview_window_after_insertion = 1

let g:php_refactor_command='php /csnzoo/rgrodin/bin/refactor.phar'
