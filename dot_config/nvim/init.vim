lua require('plugins')
lua require('config')

set nu! rnu!
filetype plugin indent on
syntax enable
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

let g:deoplete#enable_at_startup = 1
let g:vimtex_view_method = 'zathura'
let g:knap_settings = {
    \ "textopdfviewerlaunch": "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
    \ "textopdfviewerrefresh": "none",
    \ "textopdfforwardjump": "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%"
\ }
""""""""""""""""""
" KNAP functions "
""""""""""""""""""
" F5 processes the document once, and refreshes the view "
inoremap <silent> <F5> <C-o>:lua require("knap").process_once()<CR>
vnoremap <silent> <F5> <C-c>:lua require("knap").process_once()<CR>
nnoremap <silent> <F5> :lua require("knap").process_once()<CR>

" F6 closes the viewer application, and allows settings to be reset "
inoremap <silent> <F6> <C-o>:lua require("knap").close_viewer()<CR>
vnoremap <silent> <F6> <C-c>:lua require("knap").close_viewer()<CR>
nnoremap <silent> <F6> :lua require("knap").close_viewer()<CR>

" F7 toggles the auto-processing on and off "
inoremap <silent> <F7> <C-o>:lua require("knap").toggle_autopreviewing()<CR>
vnoremap <silent> <F7> <C-c>:lua require("knap").toggle_autopreviewing()<CR>
nnoremap <silent> <F7> :lua require("knap").toggle_autopreviewing()<CR>

" F8 invokes a SyncTeX forward search, or similar, where appropriate "
inoremap <silent> <F8> <C-o>:lua require("knap").forward_jump()<CR>
vnoremap <silent> <F8> <C-c>:lua require("knap").forward_jump()<CR>
nnoremap <silent> <F8> :lua require("knap").forward_jump()<CR>
