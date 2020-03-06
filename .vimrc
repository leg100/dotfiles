call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'hashivim/vim-terraform'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'

" Initialize plugin system
call plug#end()

" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = ","

set nocompatible                " Enables us Vim specific features
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set ttyfast                     " Indicate fast terminal conn for faster redraw
set ttymouse=xterm2             " Indicate terminal type for mouse codes
set ttyscroll=3                 " Speedup scrolling
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set number			" Show line numbers
set autowrite		        " Autosaves upon calling commands like :make
set noswapfile			" Don't create swapfiles
set autoindent			" Maintain indent after newline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set expandtab                   " Expand tabs into spaces
set noshowmode                  " We show mode with airline
set noshowmatch                 " Do not show matching brackets by flickering
set lazyredraw
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set cmdheight=2                 " Give more space for displaying messages.

colorscheme solarized8_light_high

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

augroup go
	autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

	autocmd FileType go nmap <leader>b  <Plug>(go-build)
	autocmd FileType go nmap <leader>r  <Plug>(go-run)
	autocmd FileType go nmap <leader>t  <Plug>(go-test)
augroup END

autocmd FileType yaml setlocal ts=2 sts=2 sw=2

augroup sh
	autocmd BufNewFile,BufRead sh setlocal expandtab tabstop=4 shiftwidth=4 sts=4
augroup END

let g:go_fmt_command = "goimports"

" NERDTree shortcuts
nnoremap <leader>f :NERDTreeFind<cr>
nnoremap <leader>m :NERDTreeToggle<cr>

let g:ackprg = 'ag --vimgrep'	" Use ag instead of ack with ack.vim plugin
