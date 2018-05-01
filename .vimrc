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
source ~/.vim/plugin/cscope_maps.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()


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
hi StatusLine ctermbg=NONE cterm=bold,underline
hi StatusLineNC ctermbg=NONE cterm=underline

" Custom color scheme
hi Constant ctermfg=12

" Get rid of vertical fill chars, also color
" vertical split a nicer color
hi clear VertSplit
set fillchars=vert:\ 

" Colorless gutter (same color as background)
highlight clear SignColumn

" Colorless tab bar
highlight clear TabLineFill
highlight clear Tabline


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

" easy yank/paste from clipboard
noremap <leader>y "+y
noremap <leader>p "*p

" open help in a new tab
:cabbrev help tab help

set pastetoggle=<F2>


""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_banner = 0

""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_show_diagnostics_ui = 0
let g:ycm_auto_trigger = 0
let g:ycm_key_invoke_completion = '<C-x><C-o>'
let g:ycm_error_symbol = 'er'
let g:ycm_warning_symbol = 'wn'
let g:ycm_enable_diagnostic_highlighting = 0


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
