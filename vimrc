" Global settings
set encoding=utf8

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Options
set background="dark"
colorscheme BusyBee
set number
set hls
set autoindent
set cursorline
set showtabline=1   " Always show tabs
set expandtab       " Everything I write uses spaces
set tabstop=4
set shiftwidth=4
set cindent
set incsearch
set smartcase
set nohidden

" Autocomplete
set completeopt=longest,menuone
set wildmode=longest,full
set wildmenu
let g:SuperTabDefaultCompletionType = "context"

" Highlight problematic whitespace (spaces before tabs)
hi RedundantSpaces ctermfg=214 ctermbg=160 cterm=bold
match RedundantSpaces / \+\ze\t/

" Taglist
nnoremap <silent> <F8> :TlistToggle<CR>

" In case I forget to start as root
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" For Vim as man
let $PAGER=''

" Closetag
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" Indent guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1


nnoremap <silent> <C-S-t> :CommandT<CR>
nnoremap <silent> <C-S-l> :CommandTBuffer<CR>

map <C-t> :tabnew 

"map t :tabnew<CR>:e 
map <Tab> gt
map <S-Tab> gT
map n gt
map p gT
"map [Z :tabp<CR>



no Q q
map q :q<CR>
vmap ii <ESC>i

set mouse=a

fun Ranger()
  silent !ranger --choosefile=/tmp/chosen
  if filereadable('/tmp/chosen')
    exec 'edit ' . system('cat /tmp/chosen')
    call system('rm /tmp/chosen')
  endif
  redraw!
endfun
map <C-o> :call Ranger()<CR>

function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  silent! execute 'resize ' . line('$')
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

map <leader>t :g/TODO\\|FIXME/caddexpr expand("%") . ":" . line(".") . ":" . getline(".")<cr>:cw<CR><cr>
map <leader>T :noautocmd vimgrep /TODO\\|FIXME/j **/*<cr>:cw<CR>
nnoremap <leader>o :silent execute '!xdg-open <C-R>=escape("<C-R><C-F>", "#?&;\|%")<CR> >/dev/null' \| redraw!<CR>

nnoremap <C-h> :GundoToggle<CR>
