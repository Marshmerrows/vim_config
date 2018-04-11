syntax on
set background=dark
colorscheme jellybeans

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

inoremap ii <ESC>

filetype indent on

set number
set lazyredraw
set timeoutlen=150 ttimeoutlen=0

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
        let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
        endif

" Plugin manager(vim-plug)
" Plugins installed in directory below
call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
" Initialize plugin system
call plug#end()

" <ale> plugin shenanigans
let g:ale_fixers = {
\   'c'   : ['clang-format'],
\   'cpp' : ['clang-format'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
