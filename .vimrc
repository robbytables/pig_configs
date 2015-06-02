filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*

set laststatus=2
set ruler
set showcmd
set wildmenu

set autoindent
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

set number

set ignorecase
set smartcase
set incsearch

set hidden

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

nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>h :windo wincmd K<CR>
nnoremap <Leader>r :CtrlPMRUFiles<CR>
nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <Leader>u :GundoToggle<CR>
nnoremap <Leader>v :windo wincmd H<CR>
nnoremap <Leader>W :%s/\v[[:blank:]]+$//<CR>

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

let g:syntastic_python_python_exec = '/wayfair/pkg/python2.7/latest/bin/python2.7'
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = '--disable=
                                        \broad-except,
                                        \invalid-name,
                                        \missing-docstring'

let g:ycm_autoclose_preview_window_after_insertion = 1

let g:php_refactor_command='php /csnzoo/rgrodin/bin/refactor.phar'
