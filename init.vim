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

nnoremap <leader>o o<Esc>k
nnoremap <leader>O O<Esc>j


cnoremap <leader>ahkcom !taskkill /IM %:t:r.exe <Bar> start ahk2exe /in %
cnoremap <leader>ahkexe !start %<BS><BS><BS>exe
cnoremap <leader>ahkahk !taskkill /F /IM %:t:r.exe <Bar> start ahk2exe /in % <Bar> ping 127.0.0.1 -n 3 > nul &&  start %<BS><BS><BS>exe
cnoremap <leader>wahk w <Bar> !taskkill /F /IM %:t:r.exe <Bar> start ahk2exe /in % <Bar> ping 127.0.0.1 -n 3 > nul &&  start %<BS><BS><BS>exe
cnoremap <leader>editinit edit $myvimrc <Bar> edit %:p:h/initvim/init.vim <Bar> bd $myvimrc
cnoremap <leader>showcommands g/command = "/ normal yi":e hahaho.txt<C-v><CR>Go<C-v><Esc>p:w<C-v><CR>:bd<C-v><CR> 

nnoremap <leader>tdd _i---
nnoremap <leader>tdu _xxx


function! ShowAllAHKCommands()
	call feedkeys(':!del hahaho.txt', 'n')
	call feedkeys(':e ahkvim.ahk | g/command = "/ normal yi":e hahaho.txtGop:w:bd', 'n')
	call feedkeys(':e hahaho.txt', 'n')
endfunction
function! EditMyInitVim()
	call feedkeys(':edit $myvimrc | edit %:p:h/initvim/init.vim | execute "bd " . expand($myvimrc)', 'n')
endfunction
function! GitCommitPreType()
	call feedkeys(':termigit commit -m "', 'n')
endfunction
function! GitPushPreType()
	call feedkeys(':termigit push', 'n')
endfunction

command! ShowCommands :call ShowAllAHKCommands()
command! EditInit :call EditMyInitVim()



call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
" or                                , { 'branch': '0.1.x' }

call plug#end()
