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


"""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/bundle/buftabs.vim
source ~/.vim/bundle/eunuch.vim


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

hi NonText ctermfg=grey

" Status line colors
hi StatusLine ctermbg=white ctermfg=black
hi StatusLineNC ctermbg=white ctermfg=black


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

" Disable auto-comment
:set formatoptions-=r
:set formatoptions-=o


""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the status line
set laststatus=2

" Format the status line
set statusline=%f
set statusline+=%{DetectChange()}
set statusline+=%=
set statusline+=%l
set statusline+=/
set statusline+=%L


""""""""""""""""""""""""""""""""""""""""""""""""""
" Remappings
""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy save
nnoremap <leader>w :w<cr>

" Easy make
nnoremap <leader>m :make<cr>

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
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Easier buffer keys
noremap <leader>bd :bd<cr>
noremap <leader>bda :%bd<cr>
noremap <c-n> :bp<cr>
noremap <c-m> :bn<cr>

" Useful mappings for managing tabs
noremap <leader>te :tabedit 
noremap <leader>to :tabonly<cr>
noremap <leader>tsb :tab sball<cr>
noremap <silent><c-o> :tabp<cr>
noremap <silent><c-p> :tabn<cr>

" Disable ex mode
:map Q <Nop>

" opens $MYVIMRC in a new tab
:nmap <Leader>vim :tabedit $MYVIMRC<cr>

" open help in a new tab
:cabbrev help tab help

set pastetoggle=<F2>


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
augroup END " }
