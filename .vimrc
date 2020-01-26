call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'hashivim/vim-terraform'

" Initialize plugin system
call plug#end()

" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = ","

set nocompatible                " Enables us Vim specific features
set ttyfast                     " Indicate fast terminal conn for faster redraw
set ttymouse=xterm2             " Indicate terminal type for mouse codes
set ttyscroll=3                 " Speedup scrolling
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set number			" Show line numbers
set autowrite		        " Autosaves upon calling commands like :make
set noswapfile			" Don't create swapfiles

" Autosave every 400ms: https://vi.stackexchange.com/a/79
autocmd CursorHold * update
set updatetime=400

colorscheme jelleybeans

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

augroup go
	autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

	autocmd FileType go nmap <leader>b  <Plug>(go-build)
	autocmd FileType go nmap <leader>r  <Plug>(go-run)
	autocmd FileType go nmap <leader>t  <Plug>(go-test)
augroup END

let g:go_fmt_command = "goimports"
