call plug#begin('~/.local/share/nvim/plugged')
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'hashivim/vim-terraform'
Plug 'sebdah/vim-delve'
Plug 'justinmk/vim-dirvish'
Plug 'fatih/vim-go'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-autoformat/vim-autoformat'
Plug 'tpope/vim-abolish'
Plug 'ruanyl/vim-gh-line'

Plug 'folke/trouble.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'j-hui/fidget.nvim'

" nvim-lightbulb
"
" The FixCursorHold.nvim plugin is strongly recommended to
" work around existing Neovim issues surrounding the
" CursorHold and CursorHoldI autocmd events.
Plug 'kosayoda/nvim-lightbulb'
Plug 'antoinemadec/FixCursorHold.nvim'

Plug 'm-demare/hlargs.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'weilbith/nvim-code-action-menu'
Plug 'williamboman/nvim-lsp-installer'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

iabbrev ccopy Copyright 2021 Louis Garman, all rights reserved.
iabbrev @@ louisgarman@gmail.com
iabbrev ssig -- <cr>Louis Garman<cr>louisgarman@gmail.com

" Leader key
let mapleader = ","

set nocompatible                " Enables us Vim specific features
set background=light
syntax enable
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set mouse=n                     " Enable mouse support in normal mode
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autowrite                   " Autosaves upon calling commands like :make
set nowritebackup               " https://github.com/fsnotify/fsnotify/issues/92#issuecomment-262435215
set noswapfile                  " Don't create swapfiles
set autoindent                  " Maintain indent after newline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set noshowmode                  " Lightline already shows mode in status line
set noshowmatch                 " Do not show matching brackets by flickering
set lazyredraw
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set cmdheight=2                 " Give more space for displaying messages.
set expandtab                   " Expand tabs into spaces
set shiftwidth=4                " 1 tab == 4 spaces
set tabstop=4                   " 1 tab == 4 spaces
set matchtime=3                 " Highlight matching parenthesis after 300ms
set number                      " Show line number of cursor
set hidden                      " Don't prompt to save buffer
set updatetime=300              " Suggested by coc.nvim
set shortmess+=c                " Suggested by coc.nvim

colorscheme solarized

augroup linenumbers
	autocmd!
    " Don't show line numbers in terminal mode
	autocmd TermOpen * setlocal nonumber norelativenumber
    " don't show line numbers in dirvish file viewer
    autocmd FileType dirvish setlocal nonumber norelativenumber
augroup END

" Double-tap escape to unhighlight search terms
nnoremap <silent> <esc><esc> :nohlsearch<cr>
" Map shortcuts for switching window panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Map shortcut to edit vim config
nnoremap <leader>e :edit $MYVIMRC<cr>
" Map shortcut to source current file
nnoremap <leader>s :source %<cr>
" Escape key exits terminal mode, or exits fuzzyfinder popup in terminal mode
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
" [Shift-]Page up/down exits terminal mode and scrolls up/down
tnoremap <PageUp> <c-\><c-n><PageUp>
tnoremap <PageDown> <c-\><c-n><PageDown>
tnoremap <S-PageUp> <c-\><c-n><PageUp>
tnoremap <S-PageDown> <c-\><c-n><PageDown>
" Map spacebar to visually select a word
nnoremap <space> viw
" Map _ to move current line up one line
nnoremap _ ddkkp
" Map shortcuts for switching panes
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Map shortcut to save file
nnoremap <leader>w :write<cr>

"
" Fuzzyfinder (FZF)
"

" Map Ctrl-P to list files, and in dirvish file viewer
nnoremap <c-p> :FZF<cr>
augroup fzf
    autocmd!
    autocmd FileType dirvish nunmap <c-p>
    " Map Ctrl-P in dirvish to list files in FZF
    autocmd FileType dirvish nnoremap <c-p> :FZF<cr>
augroup END
" Map Ctrl-B to list buffers
nnoremap <c-b> :Buffers<cr>

" ------------------------------------
" j-hui/fidget.nvim
" ------------------------------------
"
lua require("fidget").setup()

" ------------------------------------
" kosayoda/nvim-lightbulb
" ------------------------------------
"
" for every filetype show lightbulb if code action available action
" at current cursor position
autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()

" ------------------------------------
" weilbith/nvim-code-action-menu
" ------------------------------------
"
let g:code_action_menu_window_border = 'single'

" ------------------------------------
" folke/trouble.nvim
" ------------------------------------
"
lua require("trouble").setup()

" Configure Golang LSP.
"
" https://github.com/golang/tools/blob/master/gopls/doc/settings.md
" https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
" https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim
" https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls
" https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim
" https://www.getman.io/posts/programming-go-in-neovim/
"
lua <<EOF
require('lspconfig').gopls.setup{
  cmd = {'gopls'},
  settings = {
    gopls = {
      analyses = {
        nilness = true,
        unusedparams = false,
        unusedwrite = true,
        useany = true,
      },
      env = {
        GOFLAGS = "-tags=integration",
      },
      experimentalPostfixCompletions = true,
      gofumpt = true,
      staticcheck = true,
      usePlaceholders = true,
    },
  },
  on_attach = on_attach,
}
EOF

" Configure LSP code navigation shortcuts
" as found in :help lsp
"
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gk         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gc        <cmd>lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <silent> gt        <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gn        <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gs        <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gw        <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" Replaced LSP implementation with code action plugin...
"
" nnoremap <silent> ga        <cmd>lua vim.lsp.buf.code_action()<CR>
"
nnoremap <silent> ga        <cmd>CodeActionMenu<CR>

nnoremap <silent> [g        <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g        <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> ]s        <cmd>lua vim.diagnostic.show()<CR>

" Replaced LSP implementation with trouble plugin...
"
" nnoremap <silent> <space>q  <cmd>lua vim.diagnostic.setloclist()<CR>
"
nnoremap <silent> <space>q  <cmd>Trouble<CR>

" Setup Completion
" https://github.com/hrsh7th/nvim-cmp#recommended-configuration
"
lua <<EOF
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'nvim_lsp_signature_help' },
  },
})
EOF

" Setup Treesitter and friends
"
" NOTE: originally used `ensure_installed = "all"` but an experimental PHP
" parser was causing NPM lockfile errors.
"
lua <<EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = { "bash", "c", "cmake", "css", "dockerfile", "go", "gomod", "gowork", "hcl", "html", "http", "javascript", "json", "lua", "make", "markdown", "python", "regex", "ruby", "rust", "toml", "vim", "vimdoc", "zig" },
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
require('hlargs').setup()
EOF

"
" vim-go
"
let g:go_code_completion_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_imports_autosave = 1
let g:go_gopls_enabled = 0
let g:go_metalinter_autosave = 0
let g:go_fmt_autosave = 1

" Launch go cmds inside a tty
let g:go_term_enabled = 0

fun! GoFumpt()
  :silent !gofumpt -w %
  :edit
endfun

augroup go
	autocmd!
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
	autocmd FileType go nmap <leader>b <Plug>(go-build)
	autocmd FileType go nmap <leader>r <Plug>(go-run)
	autocmd FileType go nmap <leader>t <Plug>(go-test)
	autocmd FileType go nmap <leader>f <Plug>(go-test-func)
	autocmd FileType go nmap <leader>c <Plug>(go-test-compile)
	autocmd FileType go nmap <leader>l <Plug>(go-metalinter)
	autocmd FileType go nmap <leader>a :GoAlternate<cr>
    autocmd FileType go setlocal formatoptions+=ro " Auto-add // after hitting return or 'o'
    autocmd FileType go setlocal textwidth=80     " Wrap text after 80 columns
augroup END

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

augroup yaml
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2
augroup END

augroup shellz
    autocmd!
    autocmd FileType sh setlocal tabstop=4 shiftwidth=4 sts=4
augroup END

let g:ackprg = 'ag --vimgrep'	" Use ag instead of ack with ack.vim plugin

augroup webdev
    autocmd!
    autocmd CursorHold *.tmpl update
    autocmd CursorHold *.md update
    autocmd CursorHold *.css update
    autocmd CursorHold *.scss update
    autocmd CursorHold *.html update
    autocmd CursorHold *.svg update

    autocmd FileType gohtmltmpl setlocal tabstop=2 shiftwidth=2 sts=2
    autocmd FileType css setlocal tabstop=2 shiftwidth=2 sts=2
    autocmd FileType scss setlocal tabstop=2 shiftwidth=2 sts=2
augroup END

let g:terraform_fmt_on_save = 1

" shortcut to close quickfix window and return to buffer
" https://vi.stackexchange.com/a/19743
nnoremap <leader>q :cclose<CR>:TroubleClose<CR>

" don't highlight trailing whitespace in terminals
" https://github.com/ntpeters/vim-better-whitespace/issues/158#issuecomment-1300539929
augroup vimrc
  autocmd TermOpen * :DisableWhitespace
augroup END
