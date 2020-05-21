call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'hashivim/vim-terraform'
Plug 'ntpeters/vim-better-whitespace'
Plug 'godlygeek/tabular'
Plug 'chrisbra/csv.vim'
Plug 'justinmk/vim-dirvish'

" Initialize plugin system
call plug#end()

" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = ","

set nocompatible                " Enables us Vim specific features
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set ttyfast                     " Indicate fast terminal conn for faster redraw
set mouse=n                     " Enable mouse support in normal mode
" not recognised by neovim
" set ttyscroll=3                 " Speedup scrolling
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

let g:netrw_liststyle=3         " Tree style listing

if has('nvim')
        let g:python_host_prog = '~/.pyenv/versions/2.7.16/bin/python'
        let g:python3_host_prog = '~/.pyenv/versions/3.8.1/bin/python'

        tnoremap <esc> <c-\><c-n>        " escape key exits terminal mode
        tnoremap <C-h> <c-\><c-n><c-w>h
        tnoremap <C-j> <c-\><c-n><c-w>j
        tnoremap <C-k> <c-\><c-n><c-w>k
        tnoremap <C-l> <c-\><c-n><c-w>l
endif


au FileType dirvish setlocal nonumber norelativenumber " don't show line numbers in dirvish file viewer

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

colorscheme solarized8_light_high

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

let g:go_fmt_command = "goimports"
let g:go_term_mode = "split"
let g:go_term_height = 10
let g:go_term_enabled = 0
let g:go_term_enabled = 0

set pastetoggle=<leader>p

augroup go
	autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

	autocmd FileType go nmap <leader>b  <Plug>(go-build)
	autocmd FileType go nmap <leader>r  <Plug>(go-run)
	autocmd FileType go nmap <leader>t  <Plug>(go-test)
	autocmd FileType go nmap <leader>f  <Plug>(go-test-func)
	autocmd FileType go nmap <leader>a  :GoAlternate
        "autocmd FileType go nmap <leader>rt <Plug>(go-run-tab)
        "autocmd FileType go nmap <leader>rs <Plug>(go-run-split)
        "autocmd FileType go nmap <leader>rv <Plug>(go-run-vertical)
augroup END

autocmd FileType yaml setlocal ts=2 sts=2 sw=2

autocmd FileType sh setlocal expandtab tabstop=4 shiftwidth=4 sts=4


let g:ackprg = 'ag --vimgrep'	" Use ag instead of ack with ack.vim plugin

" let g:netrw_banner = 0          " hide netrw header/banner

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
" let g:go_def_mapping_enabled = 0
" 
" " Smaller updatetime for CursorHold & CursorHoldI
" set updatetime=300
" " don't give |ins-completion-menu| messages.
" set shortmess+=c
" " always show signcolumns
" set signcolumn=yes
" 
" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"

" Add your own mapping. For example:
noremap <silent> <leader>e :Explore<CR>

aug CSV_Editing
        au!
        au BufRead,BufWritePost *.csv :%ArrangeColumn
        au BufWritePre *.csv :%UnArrangeColumn
aug end

let g:better_whitespace_filetypes_blacklist = ['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'csv']
