" Global settings
set nocp
set encoding=utf8
set runtimepath=$XDG_CONFIG_HOME/nvim,$XDG_CONFIG_HOME/nvim/after,$VIM/vimfiles,$VIMRUNTIME
set backspace=2

call pathogen#infect()

" Syntax
syntax on
filetype plugin indent on
set background="dark"
colorscheme industrial

" Options
set viminfo+=n$XDG_CACHE_HOME/viminfo
set number
set autoindent
set hls
set ofu=syntaxcomplete#Complete
set cursorline
set showtabline=1   " Always show tabs
set expandtab       " Everything I write uses spaces
set tabstop=4
set shiftwidth=4
set incsearch
set smartcase
set nohidden
set mouse=a
set modeline
set laststatus=2
filetype indent on
set clipboard=unnamed
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set formatoptions+=j " Delete comment character when joining commented lines.
set tabpagemax=50

" Breaks arrows, makes esc imediate without timeoutlen=0
set noek
set timeoutlen=500

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

function WriteSudo()
    silent! write ! sudo tee "%" >/dev/null
    silent! edit!
endfunction

cmap w!! :call WriteSudo()<CR>

" In case I forget to start as root
command W w

" For Vim as man
let $PAGER=''

" Closetag
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source $XDG_CONFIG_HOME/nvim/bundle/closetag/plugin/closetag.vim

" Indent guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1


"nnoremap <silent> <C-S-t> :CommandT<CR>
"nnoremap <silent> <C-S-l> :CommandTBuffer<CR>

map <C-t> :tabnew 
map <Tab> gt
map <S-Tab> gT

map \| :vsplit 
map _ :split 
map j <C-w>j
map k <C-w>k
map h <C-w>h
map l <C-w>l

" Go Comment
map gc <leader>ci
" Go Reorder
map gr :Reorder 

" Misc shortcuts
no Q gqip
"map q :q<CR>
vmap ii <ESC>i

" Todo
map <leader>t :g/TODO\\|FIXME/caddexpr expand("%") . ":" . line(".") . ":" . getline(".")<cr>:cw<CR><cr>
map <leader>T :noautocmd vimgrep /TODO\\|FIXME/j **/*<cr>:cw<CR>

" Open File
nnoremap <leader>o :silent execute '!xdg-open <C-R>=escape("<C-R><C-F>", "#?&;\|%")<CR> >/dev/null' \| redraw!<CR>

" Map Gundo
nnoremap <Backspace> :GundoToggle<CR>

" UltiSnips
let g:UltiSnipsSnippetsDir="$XDG_CONFIG_HOME/vim/bundle/ultisnips/UltiSnips"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Templates
autocmd! BufNewFile * silent! 0r $XDG_CONFIG_HOME/vim/templates/%:e

" clear search highlighting on esc
nmap <Esc> <Esc>:noh<CR>

" Navigate through wrapped lines
nmap j gj
nmap k gk
nmap Y y$


fu! DeleteMethod()
    let @y=@_
    let @z=@_
    normal! %"yyi(hh"zdi)
    if @z != @_
        echo "a"
        normal! "yP
    else
        echo "b"
        normal! ^D"yp
    endif
endfunction


" Methods
nmap dm  :call DeleteMethod()<cr>

set fillchars=vert:│,fold:-

digr \|= 8872 \|- 8871

set directory^=$XDG_CACHE_HOME//

"let g:Powerline_symbols = 'fancy'

let g:qcc_query_command='lbdbq'
au BufRead $XDG_CACHE_HOME/mutt* setlocal omnifunc=QueryCommandComplete
au BufRead $XDG_CACHE_HOME/mutt* let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:markdown_fenced_languages = ["kotlin", "javascript", "css", "html", "python", "java", "rust"]

autocmd FileType tex :NoMatchParen
au FileType tex setlocal nocursorline

let g:javascript_conceal=1
let g:airline_right_sep=' ◀'
let g:airline_left_sep='▶ '
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1

" Racer
set hidden
let g:racer_cmd = $XDG_CONFIG_HOME/"nvim/bundle/racer/target/release/racer"
let $RUST_SRC_PATH="/usr/src/rust/src/"