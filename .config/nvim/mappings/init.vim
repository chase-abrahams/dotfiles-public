" Import other mappings to keep things clean
source $HOME/.config/nvim/mappings/python_mappings.vim
source $HOME/.config/nvim/mappings/latex_mappings.vim

" Basic Key Mappings

" imap <C-h> <C-w>h
" imap <C-j> <C-w>j
" imap <C-k> <C-w>k
" imap <C-l> <C-w>l
" g Leader key
let mapleader=","
let maplocalleader="\\"

" Better indenting
vnoremap < <gv
vnoremap > >gv

" - to delete a line
nnoremap - dd

" Open up the vimrc in a vsplit to add something
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Ctrl + U to uppercase a word in insert mode
inoremap <C-u> <esc>viwUea

" Better nav for omnicomplete
" inoremap <expr> <c-j> ("\<C-n>")
" inoremap <expr> <c-k> ("\<C-p>")

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
" inoremap <c-u> <ESC>viwUi
" nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
" nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
" nnoremap <silent> <S-TAB> :bprevious<CR>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Use control-c instead of escape
nnoremap <silent> <C-c> <Esc>
" <TAB>: completion.
" inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better window navigation
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Terminal window navigation
" tnoremap <C-h> <C-\><C-N><C-w>h
" tnoremap <C-j> <C-\><C-N><C-w>j
" tnoremap <C-k> <C-\><C-N><C-w>k
" tnoremap <C-l> <C-\><C-N><C-w>l
" inoremap <C-h> <C-\><C-N><C-w>h
" inoremap <C-j> <C-\><C-N><C-w>j
" inoremap <C-k> <C-\><C-N><C-w>k
" inoremap <C-l> <C-\><C-N><C-w>l
" tnoremap <Esc> <C-\><C-n>

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize -2<CR>
nnoremap <silent> <M-k>    :resize +2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>

" Better nav for omnicomplete
" inoremap <expr> <c-j> ("\<C-n>")
" inoremap <expr> <c-k> ("\<C-p>")

nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" type 'Sb' for a block
" type 'Sv' or 'S{' for a variable
" type 'Si' for an if statement
" type 'Sw' for a with statement
" type 'Sc' for a comment
" type 'Sf' for a for statement
" type 'S%' for other template tag

let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"

" Access related django files quickly
let g:last_relative_dir = ''
nnoremap \1 :call RelatedFile ("models.py")<cr>
nnoremap \2 :call RelatedFile ("views.py")<cr>
nnoremap \3 :call RelatedFile ("forms.py")<cr>
nnoremap \4 :call RelatedFile ("urls.py")<cr>
nnoremap \5 :call RelatedFile ("tests")<cr>
nnoremap \6 :call RelatedTemplates()<cr>
nnoremap \0 :e $PWD/config/settings/local.py<cr>
nnoremap \9 :e $PWD/config/urls.py<cr>

fun! RelatedTemplates()
    let template_dir = expand("%:h:h"). '/templates/'
    let app_template_dir = template_dir . expand("%:h:t")
    if isdirectory(app_template_dir)
        exec "edit " . app_template_dir
        return ''
    endif
    echom "Directory does not exist " . app_template_dir
    if isdirectory(template_dir)
        exec "edit " . template_dir
        return ''
    endif
    echom "Directory does not exist " . template_dir
endfun

fun! RelatedFile(file)
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        exec "edit %:h/" . a:file
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
    if g:last_relative_dir != ''
        exec "edit " . g:last_relative_dir . a:file
        return ''
    endif
    echo "Cant determine where relative file is : " . a:file
    return ''
endfun

fun SetAppDir()
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
endfun
autocmd BufEnter *.py call SetAppDir()

" Mapping for jumping to the next placholder
inoremap <C-n> <Plug>IMAP_JumpForward
nnoremap <C-n> <Plug>IMAP_JumpForward
vnoremap <C-n> <Plug>IMAP_JumpForward

