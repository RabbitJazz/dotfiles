" set syntax highlightning on
syntax on
" Vim colorscheme
colorscheme nord
" turn hybrid line numbers on
set number relativenumber
highlight LineNr ctermfg=yellow cterm=bold 
highlight CursorLineNr ctermfg=red cterm=bold
" Vim colorscheme
set autoindent
" Plugin section managed by vim-plug
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

	
call plug#end()

execute pathogen#infect()
" Styntastic configurations
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
