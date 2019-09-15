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
set guioptions-=L
set guioptions-=r
set guifont=Terminus\ 12
" These two options remove the padding
" at the bottom when fullscreened
set guioptions-=e
set guiheadroom=0


"""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'natebosch/vim-lsc'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""
" Language Servers
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:lsc_server_commands = {
  \ 'c': { 'command': 'ccls', 'suppress_stderr': v:true,
  \   'message_hooks': {
  \       'initialize': {
  \         'initializationOptions':  {'cache': {'directory': '/tmp/ccls/cache'}},
  \         'rootUri': {m, p ->lsc#uri#documentUri(fnamemodify(findfile('compile_commands.json',expand('%:p') . ';'), ':p:h'))} 
  \       },
  \     },
  \   },
  \ 'cpp': { 'command': 'clangd', 'suppress_stderr': v:true},
  \ 'python': 'pyls',
  \ }

let g:lsc_auto_map = {
    \ 'GoToDefinition': '<C-]>',
    \ 'FindReferences': 'gr',
    \ 'ShowHover': 'K',
    \ 'Completion': 'omnifunc',
    \}

let g:lsc_enable_autocomplete = v:false


"""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""
" Enable mouse
"set mouse=a

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
"set foldmethod=indent

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

if has("gui_running")
    set background=light
else
    set background=dark
endif

" Grey line numbers
hi LineNr ctermfg=grey

" Grey tildes (where text ends)
hi NonText ctermfg=grey

" Status line colors
hi StatusLine ctermbg=0 cterm=bold
hi StatusLineNC ctermbg=0 cterm=none

" Get rid of vertical fill chars, also color
" vertical split a nicer color
hi clear VertSplit
hi StatusLine ctermfg=white ctermbg=none
hi StatusLineNC ctermfg=grey ctermbg=none
set fillchars=stl:\ ,vert:\ 
set fillchars=vert:\ 

" Colorless tab bar and sign column
"au VimEnter * hi clear TabLineFill Tabline SignColumn
hi Tabline ctermbg=none ctermfg=grey cterm=none
hi clear TabLineFill
hi clear SignColumn
hi SignColumn ctermbg=none


""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, Backups, and Undo
""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn off backup.
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

" Easier window movement
nnoremap <silent><c-l> <c-w>l
nnoremap <silent><c-h> <c-w>h
nnoremap <silent><c-k> <c-w>k
nnoremap <silent><c-j> <c-w>j

" Easier buffer keys
nnoremap <leader>bd :bp\|bd #<cr>
nnoremap <c-n> :bn<cr>
nnoremap <c-p> :bp<cr>

" Disable ex mode
:map Q <Nop>

" opens $MYVIMRC in a new tab
:nmap <Leader>vim :tabedit $MYVIMRC<cr>

" paste last yanked thing
noremap <leader>p "0p

set pastetoggle=<F2>

tmap <esc> <c-w>N


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
