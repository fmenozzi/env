Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" For colored output install https://github.com/sharkdp/bat

let g:fzf_layout = { 'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5 } }

nmap <leader>f :Files<cr>
nmap <leader>o :Files ~<cr>
nmap <leader>l :Locate<space>
nmap <leader>b :Buffers<cr>
nmap <leader>h :History<cr>
