call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Initialize plugin system
call plug#end()

" Autosave every 400ms: https://vi.stackexchange.com/a/79
autocmd CursorHold * update
set updatetime=400
" Autosaves upon calling commands like :make
set autowrite

" Don't create swapfiles
set noswapfile

colorscheme jelleybeans

" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = ","

" Go shortcuts
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
