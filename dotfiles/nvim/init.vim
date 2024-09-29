"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set nowrap
set scrolloff=8
set sidescrolloff=8

set number
set cursorline

set splitbelow
set splitright

set conceallevel=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Maps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

imap jj <esc>

let mapleader = "\<space>"

nmap <leader>x :!xdg-open %<cr><cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

vnoremap < <gv
vnoremap > >gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically install vim-plug if not present.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/better-whitespace.vim
source ~/.config/nvim/plugins/delimitmate.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/gitgutter.vim
source ~/.config/nvim/plugins/go.vim
source ~/.config/nvim/plugins/kitty.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/nord.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/rust.vim
source ~/.config/nvim/plugins/wiki.vim
source ~/.config/nvim/plugins/ycm.vim

call plug#end()

" Don't open vim-plug command windows in new split.
let g:plug_window = 'enew'

colorscheme nord

syntax enable
filetype plugin indent on
