""""""""""""""""""""""""""""""""""""""""""""""""""
" Author:
"   Alex Macdonald
"
" Taken from https://amix.dk/vim/vimrc.html
"
""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable vi backwards compatibility
set nocompatible
" Enable filetype plugins
filetype plugin on
filetype indent on

" Switch buffer even if current buffer has changes
" without displaying error
set hidden

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Execute local .vimrc file in current directory
set exrc
set secure

" Unicode OK
set encoding=utf-8

" Dont search inculde files when running autocomplete
set complete-=i


"""""""""""""""""""""""""""""""""""""""""""""""""
" GUI
"""""""""""""""""""""""""""""""""""""""""""""""""
set guioptions-=T
set guioptions-=r

"""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/plugin/bclose.vim
source ~/.vim/plugin/Rename.vim

call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""
" Language Servers
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

if executable('cquery')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'cquery',
      \ 'cmd': {server_info->['cquery']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
   autocmd FileType cpp setlocal omnifunc=lsp#complete
   autocmd FileType cpp setlocal signcolumn=yes
endif

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
    autocmd FileType python setlocal omnifunc=lsp#complete
    autocmd FileType python setlocal signcolumn=yes
endif


"""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""
" Enable mouse
set mouse=a

" Disable line wrapping
set nowrap

" Height of the command bar
set cmdheight=1

" Turn on the WiLd menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignorecase

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Allow line numbers
set number

" Some fancy search highlighting
" To turn off highlighting after finished search
" either use escape or return
set hls
set showmatch
set incsearch
" Use smartcase
set ignorecase
set smartcase
" This turns off highlighting when done
nnoremap <silent><cr> :noh<cr><cr>
nnoremap <silent><esc> :noh<cr>
nnoremap <esc>^[ <esc>^[

" Center the cursor
set scrolloff=10

" Disable folding
set nofoldenable

set completeopt-=preview

""""""""""""""""""""""""""""""""""""""""""""""""""
" Environment
""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow 'fuzzy'/recursive file finding
set path+=**


""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Grey line numbers
hi LineNr ctermfg=grey

" Grey tildes (where text ends)
hi NonText ctermfg=grey

" Status line colors
hi StatusLine ctermbg=0 cterm=bold
hi StatusLineNC ctermbg=0 cterm=none

" Custom color scheme
hi String ctermfg=12
hi Character ctermfg=12
hi Boolean ctermfg=12
hi Float ctermfg=12
hi Number ctermfg=12

" Get rid of vertical fill chars, also color
" vertical split a nicer color
hi clear VertSplit
hi StatusLine ctermfg=white ctermbg=none
hi StatusLineNC ctermfg=white ctermbg=none
set fillchars=stl:\ ,vert:\ 
set fillchars=vert:\ 

" Colorless tab bar and sign column
"au VimEnter * hi clear TabLineFill Tabline SignColumn
hi Tabline ctermbg=none ctermfg=white cterm=none
hi clear TabLineFill
hi SignColumn ctermbg=none


""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, Backups, and Undo
""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn off backup. This vimrc is for projects
" which should have git
set nobackup
set nowb
set noswapfile

" Reload file when an external modification has been made
au FocusGained,BufEnter * :silent! !

" Automatically save the file while editing it (currently disabled)
" set autowrite


""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, Tab, and Indent
""""""""""""""""""""""""""""""""""""""""""""""""""
" Change tabs to spaces and tab to current amount
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab


""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the status line
set laststatus=2

" Format the status line
set statusline=%f
set statusline+=%{DetectChange()}
set statusline+=%=
set statusline+=%c
set statusline+=\ 
set statusline+=%l
set statusline+=/
set statusline+=%L


""""""""""""""""""""""""""""""""""""""""""""""""""
" Remappings
""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy save
nnoremap <leader>w :w<cr>

" Open file explorer where the current file is
nnoremap <leader>q :Ex<cr>

" Remap increment and decrement to =/-
nnoremap = <c-a>
nnoremap - <c-x>

" Remap ctrl-a/ctrl-e to go to start/end of line
" But don't include newline in visual mode
nnoremap <c-a> <Home>
nnoremap <c-e> <End>
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
vnoremap <c-a> <Home>
vnoremap <c-e> <End>h

" Easier window movement
nnoremap <silent><c-l> <c-w>l
nnoremap <silent><c-h> <c-w>h
nnoremap <silent><c-k> <c-w>k
nnoremap <silent><c-j> <c-w>j

" Easier buffer keys
noremap <leader>bd :Kwbd<cr>
noremap <c-n> :bp<cr>
noremap <c-m> :bn<cr>

" Useful mappings for managing tabs
noremap <leader>te :tabedit 
noremap <silent><c-o> :tabp<cr>
noremap <silent><c-p> :tabn<cr>

" Disable ex mode
:map Q <Nop>

" opens $MYVIMRC in a new tab
:nmap <Leader>vim :tabedit $MYVIMRC<cr>

" opens .local.vimrc in a new tab
:nmap <Leader>local :tabedit .local.vimrc<cr>

" quickly switch to the shell
noremap <leader>sh :sh<cr>

" paste last yanked thing
noremap <leader>p "0p

set pastetoggle=<F2>


""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_banner = 0


""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper Functions
""""""""""""""""""""""""""""""""""""""""""""""""""
function! DetectChange()
    return (&modified ? '*' : '')
endfunction

" Reload vimrc whenever it changes
augroup reload_vimrc " {
autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    autocmd BufWritePost .local.vimrc source .local.vimrc
    autocmd FileType * setlocal formatoptions-=c formatoptions-=o formatoptions-=r
augroup END " }
