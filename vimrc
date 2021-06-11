" Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'embear/vim-localvimrc'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'rakr/vim-one'
" TODO filter gitignore out of nerdtree
Plug 'itchyny/lightline.vim'
Plug 'bfogarty/ale', { 'branch': 'isort-auto-pipenv' }
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'janko-m/vim-test'
Plug 'chaoren/vim-wordmotion'
Plug 'posva/vim-vue'
call plug#end()


" Configurate the vim
let mapleader = ","
noremap <Space> :
set number

set tabstop=4
set hlsearch
set backspace=2

set ignorecase
set smartcase

command! PrettyJson %!python -m json.tool

autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2


nmap <leader>f :Files<CR>
nmap <leader>d :ALEGoToDefinition<CR>
nmap <leader><C-t> :Tags<CR>
nmap <leader><C-f> :Rg<CR>
" no completion preview, only insert longest common text
set completeopt=menu,longest
" use ALE for completion
set omnifunc=ale#completion#OmniFunc

let g:lightline = {
\   'colorscheme': 'one',
\   'active': {
\       'left': [
\           [ 'mode', 'paste' ],
\           [ 'gitbranch', 'readonly', 'relativepath', 'modified' ]
\       ],
\       'right': [ [ 'lineinfo' ], [ 'project' ] ]
\   },
\   'component_function': {
\       'project': 'CurrentProject',
\       'gitbranch': 'fugitive#head',
\   },
\ }
function! CurrentProject()
    " the current directory, relative to ~/dev/
    return fnamemodify(getcwd(), ':~:s?\~\/dev\/??') 
endfunction

let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'python': ['flake8', 'pyls'],
\   'javascript': ['eslint']
\ }
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'python': ['black', 'isort'],
\   'javascript': ['prettier'],
\   'go': ['goimports']
\ }
" extended by ftplugin
let g:ale_use_global_executables=1 
let g:ale_pattern_options = {}
let g:localvimrc_whitelist = [$HOME.'/code/[^/]\+/.lvimrc']
let g:vue_pre_processors = []
function! DockerTransform(cmd)
    " Use `test` as the Compose service, unless `b:test_service` is set
    let l:service = exists('b:test_service') ? b:test_service : 'test'
    return 'docker-compose run --service-ports '.l:service.' '.a:cmd
endfunction
function! PersistStrategy(cmd)
    if !exists("g:test#vimterminal_buffer") || !bufexists(g:test#vimterminal_buffer)
        belowright 20 new
        let g:test#vimterminal_buffer =
            \ term_start(&shell, {'term_finish': 'close', 'curwin': 1})
        wincmd p
    endif
    call term_sendkeys(g:test#vimterminal_buffer, a:cmd . "\<CR>")
endfunction


let g:test#custom_transformations = {'docker': function('DockerTransform')}
let g:test#custom_strategies = {'persist': function('PersistStrategy')}
let g:test#strategy = 'persist'


" disable background color erase (BCE) and redraw after 1 line of scroll
" workaround for vim bug enabling BCE for terminals that dont' support it
" kovidgoyal/kitty#108, microsoft/terminal#832
"
" Also sets ttyfast, which improves smoothness of redrawing but is only
" on by default for certain values of `term`, excluding `xterm-kitty`.
if &term == 'xterm-kitty'
  set t_ut= | set ttyscroll=1
endif

" Color scheme
set termguicolors
set background=dark
colorscheme one
set laststatus=2

" Auto-reload ~/.vimrc
augroup vimrc-reload
    autocmd!
    autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END
