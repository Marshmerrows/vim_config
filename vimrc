" For use with neovim(maybe vim?): apt-get install neovim / brew install neovim
" For use with vim-plug: 
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Neovim config settings in ~/.config/nvim/init.vim: (for redirecting to .vim)
"   set runtimepath^=~/.vim runtimepath+=~/.vim/after
"   let &packpath = &runtimepath
"   source ~/.vimrc
"
" The first time using this, run the command :PlugInstall in vim
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

"Prerequisites:
"pip3 install neovim
Plug 'roxma/nvim-completion-manager'

" Initialize plugin system
call plug#end()

" <ale> plugin shenanigans

" fixer 
let g:ale_fixers = { 
\   'c'   : ['clang-format'],
\   'cpp' : ['clang-format'],
\}
let g:ale_fix_on_save = 1

" <nvim-completion-manager> plugin shenanigans

"tab for autocomplete menu
"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" don't give |ins-completion-menu| messages.  For example,
" '-- XXX completion (YYY)', 'match 1 of 2', 'The only match',
set shortmess+=c
