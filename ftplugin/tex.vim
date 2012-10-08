if filereadable("Makefile")
    setlocal makeprg="make"
else
    setlocal makeprg=pdflatex\ -halt-on-error\ -interaction\ batchmode\ %
endif

setlocal spell
setlocal textwidth=80
map <F5> :make<CR><CR><CR>
