Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" For colored output install https://github.com/sharkdp/bat

let g:fzf_layout = { 'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5 } }

nmap <leader>f :Files<cr>
nmap <leader>o :Files ~<cr>
nmap <leader>l :Locate<space>
nmap <leader>b :Buffers<cr>
nmap <leader>h :History<cr>

"command! -nargs=* -complete=filepath,.:h,./,<shellcmd> vsf call s:NewSplit('vertical', <q-motion>) | FzfSearch '**' | startinsert
"command! -nargs=* -complete=filepath,.:h,./,<shellcmd> spf call s:NewSplit('horizontal', <q-motion>) | FzfSearch '**' | startinsert

function! NewSplit(split_direction)
    let new_window = win_new(split_direction, &width, &height)
    call setwinvar(new_window, '&cursor', 'cursor')
    execute 'split' split_direction
endfunction

command! -nargs=* Vsf call NewSplit('vertical') | FzfSearch '**' | startinsert
command! -nargs=* Spf call NewSplit('horizontal') | FzfSearch '**' | startinsert
