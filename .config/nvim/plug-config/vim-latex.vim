let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileCmd = 'xelatex'
let g:Tex_CompileRule_pdf	= g:Tex_CompileCmd . ' -interaction=nonstopmode $*'
let g:Tex_TEXINPUTS = $HOME . '/latex/.texlive/**,./latex/**,./**'

" Don't go to the first error
let g:Tex_GotoError = 0 

" Undo some latex-suite macros
" let g:Imap_FreezeImap = 1
