
" Option to specify whether to enable ConqueGdb
if !exists('g:ConqueGdb_Disable')
    let g:ConqueGdb_Disable = 0
endif

if exists('g:plugin_conque_gdb_loaded') || g:ConqueGdb_Disable
    finish
endif
let g:plugin_conque_gdb_loaded = 1

" Options how to split GDB window when opening new source file
let g:conque_gdb_src_splits = {'below': 'belowright split', 'above': 'aboveleft split', 'right': 'belowright vsplit', 'left': 'leftabove vsplit'}

let g:conque_gdb_default_split = g:conque_gdb_src_splits['above']

if !exists('g:ConqueGdb_SrcSplit')
    let g:ConqueGdb_SrcSplit = 'above'
elseif !has_key(g:conque_gdb_src_splits, g:ConqueGdb_SrcSplit)
    let g:ConqueGdb_SrcSplit = 'above'
    echohl WarningMsg
    echomsg "ConqueGdb: Warning the g:ConqueGdb_SrcSplit option is invalid"
    echomsg "           valid options are: 'below', 'above', 'right' or 'left'"
    echomsg ""
    echohl None
endif

" Option to define path to gdb executable
if !exists('g:ConqueGdb_GdbExe')
    let g:ConqueGdb_GdbExe = ''
endif

" Option to choose leader key to execute gdb commands.
if !exists('g:ConqueGdb_Leader')
    let g:ConqueGdb_Leader = '<Leader>'
endif

" Load python scripts now
call conque_gdb#load_python()

" Keyboard mappings
if g:conque_gdb_gdb_py_support
    if !exists('g:ConqueGdb_ToggleBreak')
        let g:ConqueGdb_ToggleBreak = g:ConqueGdb_Leader . 'b'
    endif
else
    if !exists('g:ConqueGdb_SetBreak')
        let g:ConqueGdb_SetBreak = g:ConqueGdb_Leader . 'b'
    endif
    if !exists('g:ConqueGdb_DeleteBreak')
        let g:ConqueGdb_DeleteBreak = g:ConqueGdb_Leader . 'd'
    endif
endif
if !exists('g:ConqueGdb_Print')
    let g:ConqueGdb_Print = g:ConqueGdb_Leader . 'p'
endif
if !exists('g:ConqueGdb_ReadTimeout')
    let g:ConqueGdb_ReadTimeout = 50
endif
if !exists('g:ConqueGdb_SaveHistory')
    let g:ConqueGdb_SaveHistory = 0
endif

" Commands to open conque gdb
command! -nargs=* -complete=file Gdb call conque_gdb#open(<q-args>, [
        \ 'buffer ' . bufnr("%")])

if g:conque_gdb_gdb_py_support
    exe 'nnoremap <silent> ' . g:ConqueGdb_ToggleBreak . ' :call conque_gdb#toggle_breakpoint(expand("%:p"), line("."))<CR>'
else
    exe 'nnoremap <silent> ' . g:ConqueGdb_SetBreak . ' :call conque_gdb#command("break " . expand("%:p") . ":" . line("."))<CR>'
    exe 'nnoremap <silent> ' . g:ConqueGdb_DeleteBreak . ' :call conque_gdb#command("clear " . expand("%:p") . ":" . line("."))<CR>'
endif

exe 'nnoremap <silent> ' . g:ConqueGdb_Print . ' :call conque_gdb#print_word(expand("<cword>"))<CR>'
