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
let g:tdtexttd = "_>__:"
let g:tdtextdone = "_d__:"
let g:tdtextcancel = "_c__:"
let g:tdtextpattern = "_.__:"
let g:tdsectionpattern = ".*important.*urgent.*"

nnoremap <leader>ndfo :NERDTreeFocus<CR>
nnoremap <leader>ndtr :NERDTree<CR>
nnoremap <leader>ndto :NERDTreeToggle<CR>
nnoremap <leader>ndfi :NERDTreeFind<CR>

nnoremap <leader>sa ggVG

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
nnoremap <leader>c "+
vnoremap <leader>c "+

nnoremap <leader>j 10j
vnoremap <leader>j 10j
"nnoremap <leader>jm 15j
"vnoremap <leader>jm 15j
nnoremap <leader>k 10k
vnoremap <leader>k 10k
"nnoremap <leader>ki 15k
"vnoremap <leader>kk 15k

vnoremap <leader>sP "_dP
vnoremap <leader>sp "_dP

nnoremap <leader>riw viwA@hdiwPl"_x
nnoremap <leader>riW viWA@hdiWhPl"_x
nnoremap <leader>riwc "_diw"+p
nnoremap <leader>riWc "_diW"+p

nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>


cnoremap <leader>ahkcom !taskkill /IM %:t:r.exe <Bar> start ahk2exe /in %
cnoremap <leader>ahkexe !start %<BS><BS><BS>exe
cnoremap <leader>ahkahk !taskkill /F /IM %:t:r.exe <Bar> start ahk2exe /in % <Bar> ping 127.0.0.1 -n 3 > nul &&  start %<BS><BS><BS>exe
cnoremap <leader>wahk w <Bar> !taskkill /F /IM %:t:r.exe <Bar> start ahk2exe /in % <Bar> ping 127.0.0.1 -n 3 > nul &&  start %<BS><BS><BS>exe
cnoremap <leader>editinit edit $myvimrc <Bar> edit %:p:h/initvim/init.vim <Bar> execute "bd " . expand($myvimrc)
cnoremap <leader>showcommands g/command = "/ normal yi":e hahaho.txt<C-v><CR>Go<C-v><Esc>p:w<C-v><CR>:bd<C-v><CR> 

nnoremap <leader><leader> mm:call TDRemoveMark():call TDRemoveTDMarks()'m_:let @"=g:tdtexttd:normal P`m:w
nnoremap <leader>tdmd mm:call TDRemoveMark()'m_:let @"=g:tdtextdone:normal P`m:w
nnoremap <leader>tdmc mm:call TDRemoveMark()'m_:let @"=g:tdtextcancel:normal P`m:w
nnoremap <leader>tdmu mm:call TDRemoveMark()`m:w
nnoremap <leader>tdfn mm:let @/=g:tdtexttd . ".*"n
nnoremap <leader>tdfm mm:let @/=g:tdtextpattern . ".*"`m
nnoremap <leader>tdfs mm:let @/=g:tdsectionpattern . ".*"`m

nnoremap <leader>tdmtd ddmmGpG`m:w
vnoremap <leader>tdmtd dmmGpG`m:w




function! ConfirmExit()
  "let choice = confirm("Make Session?", "&Yes\n&No", 1)
  "if choice == 1
    echom "Running mks!"
    execute "mks!"
    sleep 1
  "else
  "  echom "Exit canceled."
  "endif
endfunction

autocmd VimLeavePre ahkvim.ahk call ConfirmExit()


function! TDFindTD()
	execute '/' . g:tdtexttd 
endfunction

function! TDRemoveTDMarks()
	execute ':%s/' . g:tdtexttd . '//ge'
endfunction

function! TDRemoveMark()
	execute ':s/' . g:tdtextpattern . '//e'
endfunction

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



set undofile
let undo_dir = expand('%:p:h:h').'/undo'
exe 'set undodir='.undo_dir


call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
" or                                , { 'branch': '0.1.x' }

call plug#end()
