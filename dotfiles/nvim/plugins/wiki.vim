Plug 'lervag/wiki.vim'

let g:wiki_root = '~/documents/notes'

nmap <leader>wf :WikiPages<cr>
nmap <leader>wt :WikiTags<cr>
nmap <leader>wc :WikiToc<cr>

" When creating links from text under the cursor, convert to lowercase and
" replace spaces with dashes.
let g:wiki_link_creation = {
            \ 'md': {
            \   'link_type': 'md',
            \   'url_extension': '.md',
            \   'url_transform': { x ->
            \       substitute(tolower(x), '\s\+', '-', 'g') },
            \ },
            \}

" Use fzf for searching pages, tags, etc., with nice markdown previews.
let g:wiki_select_method = {
            \ 'pages': function('wiki#fzf#pages'),
            \ 'tags': function('wiki#fzf#tags'),
            \ 'toc': function('wiki#fzf#toc'),
            \ 'links': function('wiki#fzf#links'),
            \}
let g:wiki_fzf_pages_opts = '--preview "mdcat {1}" --preview-window="up"'
let g:wiki_fzf_tags_opts = '--preview "mdcat {2..}" --preview-window="up"'

" Use custom tag parser to recognize tags on the first line in the form
" tags: tag1, tag2, tag3...
let g:wiki_tag_scan_num_lines = 1
let s:tag_parser = {
      \ 're_findstart': '\v^tags:\s*(\w*,\s*)*\zs\w+$',
      \}
function! s:tag_parser.match(line) dict abort
  return a:line =~# '^tags:'
endfunction
function! s:tag_parser.parse(line) dict abort
  let l:tagstring = matchstr(a:line, '^tags:\s*\zs.*')
  return split(l:tagstring, ',\s*')
endfunction
function! s:tag_parser.make(taglist, ...) dict abort
  if empty(a:taglist)
    return ''
  endif
  return 'tags: ' . join(a:taglist, ", ")
endfunction
let g:wiki_tag_parsers = [s:tag_parser]
