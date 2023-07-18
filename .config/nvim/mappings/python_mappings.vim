" Django specific mappings
autocmd FileType python nnoremap <buffer> <localleader>tnt :tabnew shareforce/templates/
autocmd FileType python inoremap <buffer> <localleader>pdb import pdb; pdb.set_trace()

" Make getting cleaned form data a bit easier
autocmd FileType python inoremap <buffer> <localleader>cg <Esc>yiwea = self.cleaned_data.get('<C-r>"')
