set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set ic

"MAPPINGS

let mapleader = " "
nnoremap <leader>ndfo :NERDTreeFocus<CR>
nnoremap <leader>ndtr :NERDTree<CR>
nnoremap <leader>ndto :NERDTreeToggle<CR>
nnoremap <leader>ndfi :NERDTreeFind<CR>

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

nnoremap <leader>Y "+Y
vnoremap <leader>Y "+Y
nnoremap <leader>P "+P
vnoremap <leader>P "+P

nnoremap <leader>b "_
vnoremap <leader>b "_

nnoremap <leader>j 10j
vnoremap <leader>j 10j
"nnoremap <leader>jm 15j
"vnoremap <leader>jm 15j
nnoremap <leader>k 10k
vnoremap <leader>k 10k
"nnoremap <leader>ki 15k
"vnoremap <leader>kk 15k

nnoremap <leader>riw "_diwP
nnoremap <leader>riW "_diWP
nnoremap <leader>riwc "_diw"+p
nnoremap <leader>riWc "_diW"+p


cnoremap ahkcom !start ahk2exe /in %
cnoremap ahkexe !start %<BS><BS><BS>exe
cnoremap editinit edit $MYVIMRC

nnoremap <leader>tdd _i---
nnoremap <leader>tdu _xxx

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
" or                                , { 'branch': '0.1.x' }

call plug#end()
