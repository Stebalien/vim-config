setlocal makeprg=pdflatex\ -halt-on-error\ -interaction\ batchmode\ %
setlocal spell
setlocal textwidth=80
map <F5> :make<CR><CR><CR>
