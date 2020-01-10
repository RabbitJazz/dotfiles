" Vim configurations !
set encoding=UTF-8
scriptencoding utf-8

" Syntax highlighting
syntax on

"commentary Show command in status-bar
set showcmd

" Highlight current line
set cursorline
set ruler

" Highlight current word equivalents the cursor is on
augroup CursorMove
    autocmd CursorMoved * exe printf('match SignColumn /\V\<%s\>/', escape(expand('<cword>'), '/\'))
augroup END

" Hybrid line numbers
set number relativenumber

" Indention
filetype indent on
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

" Wildmode
set wildmode=list:longest,full
" Undo file & dir
set undofile
set undodir=/tmp

" Swp file directory
set directory=$HOME/.config/.vim/swapfiles//

" Display hidden characters
set list
set listchars=tab:▸\ ,eol:¬

" Read/Save file when switching buffers
set autowrite
set autoread

" MacOs clipboard sharing
set clipboard=unnamed

" Set spelling on for git commits and markdown files.
augroup SetSpelling
    autocmd!
    autocmd FileType gitcommit setlocal spell spelllang=en_us
    autocmd FileType markdown setlocal spell spelllang=en_us
augroup END

" Plugin section managed by Vim-plug
call plug#begin('~/.config/.vim/plugged')

" Status bar
    Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'
    Plug 'maximbaz/lightline-ale'
    set showtabline=2
" Linting & Fixers
    Plug 'dense-analysis/ale'

" Nerd tree and highlighting
    Plug 'scrooloose/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'

" Gruvbox theme
    Plug 'morhetz/gruvbox'

" Tmux navigation & focus events
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'tmux-plugins/vim-tmux-focus-events'

" Better than grep
    Plug 'mileszs/ack.vim'
    if executable('rg')
        let g:ackprg = '/usr/local/bin/rg --vimgrep'
        nno emap <leader>a :Ack!
    endif
" File searching
    Plug 'junegunn/fzf.vim'
    Plug '/usr/local/opt/fzf'
    if executable('fzf')
        nnoremap <C-f> :FZF<CR>
    endif

" Auto pairs
    Plug 'jiangmiao/auto-pairs'
    let g:AutoPairsMultilineClose = 0
    let g:AutoPairsMapSpace = 0

" Language server protocol and completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'jeetsukumaran/vim-pythonsense'
    " Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" tpope section
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'

" Git stuff
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'tpope/vim-rhubarb'
    map gh <nop>
    nnoremap <leader>gs :Gstatus<CR>
    nnoremap <leader>gc :Gcommit<CR>
    nnoremap <leader>gC :Gcommit -n<CR> " commit but ignore hooks
    nnoremap <leader>gP :Gpush<CR>
    nnoremap <leader>gfP :Gpush --force-with-lease<CR>
    nnoremap <leader>gp :Gpull<CR>
    nnoremap <leader>gf :Gfetch<CR>
    nnoremap <leader>gl :GV!<CR> " Git log for the current file
    nnoremap <leader>gL :GV<CR> " Full git log
    nnoremap <leader>gdi :Gvdiff<CR>
    nnoremap <leader>gb :Gblame<CR>
    nnoremap <leader>gm :Git checkout master<CR>
    nnoremap <leader>g- :Git checkout -<CR>
    nnoremap <leader>grm :Grebase -i master<CR>
    nnoremap <leader>gh :Gbrowse<CR>
" Gutter
    Plug 'airblade/vim-gitgutter'
    set signcolumn=yes

" Indicator for what was yanked
    Plug 'machakann/vim-highlightedyank'

call plug#end()

" Line movement binding
let mapleader = ','

" Rebinding arrow keys
vmap <Left> <gv
vmap <Right> >gv
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase

" quickly cancel search highlighting
nnoremap <leader><space> :nohlsearch<cr>

" Sort lines in alphabetical order
vnoremap <leader>s :'<,'>!sort -f<cr>

" Move visually (in case of 2 lines in a sentence)
nnoremap j gj
nnoremap k gk

" Use <TAB> to select the popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Switch between buffers
nnoremap <silent><leader>b :bnext <CR>
nnoremap <silent><leader>B :bprevious <CR>
noremap <silent><leader>x :bdelete <CR>

" Shift arrow up/down to switch between lines
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Shift tab remapping
nnoremap <S-Tab> <<

" Toggle quickfix windown
nnoremap <leader><leader> :call ToggleQuickfix()<cr>
function! ToggleQuickfix()
for buffer in tabpagebuflist()
if bufname(buffer) is# ''
  cclose
  return
endif
endfor

copen
endfunction

" Column limits
set textwidth=110
set colorcolumn=110
" Toggle between column widths
nnoremap <leader>c :call ToggleColumnWidth()<cr>
let g:wide_column = 1
function! ToggleColumnWidth()
    if g:wide_column
        set textwidth=80
        set colorcolumn=80
        let g:wide_column = 0
    else
        set textwidth=110
        set colorcolumn=110
        let g:wide_column = 1
    endif
endfunction

" Load back into the same line as before
augroup BufRead
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal! g'\"" |
    \ endif
    autocmd BufRead * normal zz
augroup END

" Trailing whitespace removal on save
augroup TrailingWhitespace
    autocmd FileType c,cpp,java,php,python,ruby,js,haskell,css,html
    autocmd BufWritePre <buffer> :%s/\s\+$//e
    command! W :w
    command! Q :q
augroup END

" Nerd Tree settings
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
augroup NerdTree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" ALE settings
let g:ale_linters = {
    \   'python': ['flake8', 'pylint'],
    \   'vim': ['vint']
    \}
let g:ale_fixers = {
    \   'python': ['black','isort','remove_trailing_lines','trim_whitespace'],
    \   'vim' : ['remove_trailing_lines','trim_whitespace']
    \}
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_fix_on_save = 1

" Lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }
let g:lightline.active = {
	\ 'left': [['mode','paste'],['filename'],['branch']],
	\ 'right': [['linter_checking','linter_errors','linter_warnings'],
    \ ['lineinfo','percent'],['fileformat','fileencoding','filetype']]
    \}
let g:lightline.inactive = {
    \ 'left': [ [ 'filename' ] ],
	\ 'right': [ [ 'lineinfo' ],
	\            [ 'percent' ] ] }
let g:lightline.tabline = {
	\ 'left': [ [ 'buffers' ] ],
	\ 'right': [ [ 'branch' ] ]
    \}
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'buffers': 'lightline#bufferline#buffers'
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'buffers': 'tabsel'
      \ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
	\}
let g:lightline.subseparator = {
	\   'left': '', 'right': ''
	\}

let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\ue009 "
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#modified = '[+]'
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#number_separator = ' '
augroup LightlineUpdate
    autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
augroup END

" Coc configuration
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent><leader> gd <Plug>(coc-definition)
nmap <silent><leader> gy <Plug>(coc-type-definition)
nmap <silent><leader> gi <Plug>(coc-implementation)
nmap <silent><leader> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
nmap <leader>f  <Plug>(coc-format-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Vim colorscheme
colorscheme gruvbox
let g:gruvbox_dark_bold = 1
let g:gruvbox_dark_contrast = 'medium'
let g:gruvbox_italicize_comments = 1

" Necessary for Pathogen
packloadall
silent! helptags ALL
