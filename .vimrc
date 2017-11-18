"rohan's vimrc"

"vim-plug for plugin management
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-vinegar'

call plug#end()

"colorscheme
syntax on
set t_Co=256
colorscheme Tomorrow-Night-Eighties

"wildmenu
set wildmode=longest,full
set wildmenu

"space as leader key
let mapleader = "\<Space>"

filetype plugin indent on
set tabstop=4
set shiftwidth=4

"move around splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"nnoremap <C-U> :call SmoothScroll(1)<Enter>
"nnoremap <C-D> :call SmoothScroll(0)<Enter>
"inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
"inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i

"smooth scrolling
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10 , 1)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 1)<CR>

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

"CtrlP customization
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
noremap <leader>p :CtrlP ~/Develop/
noremap <leader>b :CtrlPBuffer<CR>

"auto write brackets for functions/loops
nnoremap <leader>[ o{<CR>}<Esc>O

"tab navigation
nnoremap H gT
nnoremap L gt

"misc. remaps, vim-sensible
nnoremap Y y$
set incsearch
"set hlsearch
set cursorline

set timeoutlen=1000 ttimeoutlen=10

set nu
