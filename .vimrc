"rohan's vimrc"

"vim-plug for plugin management
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'JuliaEditorSupport/julia-vim'

call plug#end()

"colorscheme
syntax on
set t_Co=256
colorscheme Tomorrow-Night-RJP

"wildmenu
set wildmode=longest,full
set wildmenu

"space as leader key
let mapleader = "\<Space>"

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"nnoremap <C-U> :call SmoothScroll(1)<Enter>
"nnoremap <C-D> :call SmoothScroll(0)<Enter>
"inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
"inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i

"scroll customization
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10 , 1)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 1)<CR>
noremap <C-g> <C-U>
noremap <C-f> <C-D>

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

"fzf customization
let g:ctrlp_map = '<c-p>'
noremap <C-p> :Files<CR>
noremap <leader>p :GFiles<CR>
noremap <leader>b :Buffers<CR>
noremap <leader>/ :BLines<CR>
noremap <leader>? :Lines<CR>
noremap <leader>g :Rg!<CR>
let g:netrw_keepdir=0

"newline without comment continuation
nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da


"auto write brackets for functions/loops
nnoremap <leader>[ o{<CR>}<Esc>O

"tab navigation
nnoremap H gT
nnoremap L gt

"file navigation
nnoremap ZZ zt

"copy path into clipboard
"nmap cp :let @* = expand("%:p")<CR>

"enable calling functions in bashrc
"set shellcmdflag=-ic

"swap file directory
"set directory=$HOME/.vim/swapfiles//

"misc. remaps, vim-sensible
nnoremap Y y$
set incsearch
set nohlsearch
set cursorline

"transparent background
hi Normal guibg=NONE ctermbg=NONE
set cursorline!

set timeoutlen=1000 ttimeoutlen=10

set nu

" horizontal navigation for long lines
map <leader>l 10zl 
map <leader>h 10zh

" debuggers
autocmd FileType python map <buffer> <leader>i Oimport ipdb; ipdb.set_trace()<Esc><CR>
autocmd FileType julia map <buffer> <leader>i OMain.Infiltrator.@infiltrate<Esc><CR>
