Plug 'airblade/vim-gitgutter'

set signcolumn=yes

" These don't currently seem to work; might be neovim version?
"let g:gitgutter_realtime=0
"let g:gitgutter_eager=0

highlight! link SignColumn LineNr

highlight GitGutterAdd ctermfg=Green
highlight GitGutterChange ctermfg=Yellow
highlight GitGutterDelete ctermfg=Red
