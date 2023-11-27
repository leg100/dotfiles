-- Bootstrap lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Avoid "Re-sourcing your config is not supported with lazy.nvim"
-- https://github.com/folke/lazy.nvim/issues/1180
if not package.loaded["lazy"] then
    require("lazy").setup({
        {'mileszs/ack.vim'},
        {'tpope/vim-fugitive'},
        {'tpope/vim-eunuch'},
        {'hashivim/vim-terraform'},
        {'sebdah/vim-delve'},
        {'justinmk/vim-dirvish'},
        {'fatih/vim-go'},
        {'altercation/vim-colors-solarized'},
        {'junegunn/fzf', build = 'fzf#install()'},
        {'junegunn/fzf.vim'},
        {'itchyny/lightline.vim'},
        {'ntpeters/vim-better-whitespace'},
        {'vim-autoformat/vim-autoformat'},
        {'tpope/vim-abolish'},
        {'ruanyl/vim-gh-line'},
        {'folke/trouble.nvim'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lsp-signature-help'},
        {'hrsh7th/cmp-path'},
        {'hrsh7th/cmp-vsnip'},
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/vim-vsnip'},
        {'hrsh7th/vim-vsnip-integ'},
        {'j-hui/fidget.nvim'},
        -- The FixCursorHold.nvim plugin is strongly recommended to
        -- work around existing Neovim issues surrounding the
        -- CursorHold and CursorHoldI autocmd events.
        {'kosayoda/nvim-lightbulb'},
        {'antoinemadec/FixCursorHold.nvim'},
        {'nvim-lua/plenary.nvim'},
        {'m-demare/hlargs.nvim'},
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'pmizio/typescript-tools.nvim'},
        {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
        {'weilbith/nvim-code-action-menu'},
        {'kyazdani42/nvim-web-devicons'},
        {'pocco81/auto-save.nvim', opts = {
                condition = function(buf)
                    local fn = vim.fn
                    local utils = require("auto-save.utils.data")

                    if
                        fn.getbufvar(buf, "&modifiable") == 1 and
                        utils.not_in(fn.getbufvar(buf, "&filetype"), {'go'}) then
                        return true -- met condition(s), can save
                    end
                    return false -- can't save
                end,
            },
        },
    })
end

vim.cmd("colorscheme solarized")

vim.g.mapleader = ','

vim.opt.background = "light"
vim.cmd("syntax enable")
vim.cmd("filetype off")         -- Reset filetype detection first ...
vim.cmd("filetype plugin indent on")       -- ... and enable filetype detection
vim.opt.mouse = "n"                   -- Enable mouse support in normal mode
vim.opt.laststatus = 2                -- Show status line always
vim.opt.encoding = "utf-8"              -- Set default encoding to UTF-8
vim.opt.autoread = true                    -- Automatically read changed files
vim.opt.autowrite = true                   -- Autosaves upon calling commands like :make
vim.opt.writebackup = false               -- https://github.com/fsnotify/fsnotify/issues/92#issuecomment-262435215
vim.opt.swapfile = false                  -- Don't create swapfiles
vim.opt.autoindent = true                  -- Maintain indent after newline
vim.opt.ignorecase = true                  -- Search case insensitive...
vim.opt.smartcase = true                   -- ... but not it begins with upper case
vim.opt.showmode = false                  -- Lightline already shows mode in status line
vim.opt.showmatch = false                 -- Do not show matching brackets by flickering
vim.opt.lazyredraw = true
vim.opt.splitright = true                  -- Vertical windows should be split to right
vim.opt.splitbelow = true                  -- Horizontal windows should split to bottom
vim.opt.completeopt = menu,menuone    -- Show popup menu, even if there is one entry
vim.opt.cmdheight = 2                 -- Give more space for displaying messages.
vim.opt.expandtab = true                   -- Expand tabs into spaces
vim.opt.shiftwidth = 4                -- 1 tab == 4 spaces
vim.opt.tabstop = 4                   -- 1 tab == 4 spaces
vim.opt.matchtime = 3                 -- Highlight matching parenthesis after 300ms
vim.opt.number = true                      -- Show line number of cursor
vim.opt.hidden = true                      -- Don't prompt to save buffer
vim.opt.updatetime = 300              -- Suggested by coc.nvim
-- vim.opt.shortmess +=c                -- Suggested by coc.nvim

-- Disable line numbers in terminal mode
vim.api.nvim_create_autocmd({'TermOpen'}, {
    pattern = '*',
    command = 'setlocal nonumber norelativenumber',
})
-- Disable line numbers in dirvish directory viewer
vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = 'dirvish',
    command = 'setlocal nonumber norelativenumber',
})

-- Double-tap escape to unhighlight search terms
vim.keymap.set('n', '<esc><esc>', '<cmd>nohlsearch<cr>', {silent = true})
-- Map shortcuts for switching window panes
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
-- Map shortcut to edit vim config
vim.keymap.set('n', '<leader>e', '<cmd>edit $MYVIMRC<cr>')
-- Map shortcut to source current file
vim.keymap.set('n', '<leader>s', '<cmd>source %<cr>', {silent = false})
-- Escape key exits terminal mode, or exits fuzzyfinder popup in terminal mode
vim.keymap.set('t', '<Esc>', function()
    return vim.bo.filetype == "fzf" and "<Esc>" or "<C-\\><C-n>"
end, { expr = true })
-- [Shift-]Page up/down exits terminal mode and scrolls up/down
vim.keymap.set('t', '<PageUp>', '<c-\\><c-n><PageUp>')
vim.keymap.set('t', '<PageDown>', '<c-\\><c-n><PageDown>')
vim.keymap.set('t', '<S-PageUp>', '<c-\\><c-n><PageUp>')
vim.keymap.set('t', '<S-PageDown>', '<c-\\><c-n><PageDown>')
-- Map spacebar to visually select a word
vim.keymap.set('n', '<space>', 'viw')
-- Map _ to move current line up one line
vim.keymap.set('n', '_', 'ddkkp')
-- Map shortcuts for switching panes
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-l>', '<c-w>l')
-- Map shortcut to save file
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')

--
-- Fuzzyfinder (FZF)
--

-- Map Ctrl-P to list files, and in dirvish file viewer
vim.keymap.set('n', '<c-p>', '<cmd>FZF<cr>')
--
-- augroup fzf
--     autocmd!
--     autocmd FileType dirvish nunmap <c-p>
--     " Map Ctrl-P in dirvish to list files in FZF
--     autocmd FileType dirvish nnoremap <c-p> :FZF<cr>
-- augroup END
-- local fzfgroup = vim.api.nvim_create_augroup('dirvish', {clear = true})
-- vim.api.nvim_create_autocmd({'FileType'}, {
--     group = fzfgroup,
--     pattern = 'dirvish',
--     callback = function()
--             vim.api.nvim_del_keymap('n', '<C-p>')
--     end,
-- })
-- vim.api.nvim_create_autocmd({'FileType'}, {
--     group = fzfgroup,
--     pattern = 'dirvish',
--     callback = function()
--             vim.keymap.set('n', '<C-p>', '<cmd>FZF<cr>')
--     end,
-- })
-- Map Ctrl-B to list buffers
vim.keymap.set('', '<c-b>', '<cmd>Buffers<cr>', {remap = false})

-- ------------------------------------
-- j-hui/fidget.nvim
-- ------------------------------------
--
require("fidget").setup()

-- ------------------------------------
-- kosayoda/nvim-lightbulb
-- ------------------------------------
--
-- for every filetype show lightbulb if code action available action
-- at current cursor position
-- autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()

-- ------------------------------------
-- weilbith/nvim-code-action-menu
-- ------------------------------------
--
vim.g.code_action_menu_window_border = 'single'

-- ------------------------------------
-- folke/trouble.nvim
-- ------------------------------------
require("trouble").setup()

--
--
-- Configure LSPs
--
require("mason").setup()
require("mason-lspconfig").setup{
    ensure_installed = { "tsserver" },
}

-- Configure Golang LSP.
--
-- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
-- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls
-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim
-- https://www.getman.io/posts/programming-go-in-neovim/
--
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

-- Configure typescript LSP
require('typescript-tools').setup{}

-- Configure LSP code navigation shortcuts
-- as found in :help lsp
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {silent = true})
vim.keymap.set('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {silent = true})
vim.keymap.set('n', 'gk', '<cmd>lua vim.lsp.buf.hover()<CR>', {silent = true})
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {silent = true})
vim.keymap.set('n', 'gc', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', {silent = true})
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {silent = true})
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {silent = true})
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>', {silent = true})
vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', {silent = true})
vim.keymap.set('n', 'gw', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', {silent = true})

-- Replaced LSP implementation with code action plugin...
--
-- nnoremap <silent> ga        <cmd>lua vim.lsp.buf.code_action()<CR>
--
vim.keymap.set('n', 'ga', '<cmd>CodeActionMenu<CR>')

vim.keymap.set('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {silent = true})
vim.keymap.set('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', {silent = true})
vim.keymap.set('n', ']s', '<cmd>lua vim.diagnostic.show()<CR>', {silent = true})

-- Replaced LSP implementation with trouble plugin...
--
-- nnoremap <silent> <space>q  <cmd>lua vim.diagnostic.setloclist()<CR>
--
vim.keymap.set('n', '<space>q', '<cmd>Trouble<CR>', {silent = true})

-- Setup Completion
-- https://github.com/hrsh7th/nvim-cmp#recommended-configuration
--
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

-- Setup Treesitter and friends
--
-- NOTE: originally used `ensure_installed = --all--` but an experimental PHP
-- parser was causing NPM lockfile errors.
--
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

--
-- vim-go
--
vim.g.go_code_completion_enabled = 0
vim.g.go_def_mapping_enabled = 0
vim.g.go_imports_autosave = 1
vim.g.go_gopls_enabled = 0
vim.g.go_metalinter_autosave = 0
vim.g.go_fmt_autosave = 1

-- Launch go cmds inside a tty
-- let g:go_term_enabled = 0

-- fun! GoFumpt()
--   :silent !gofumpt -w %
--   :edit
-- endfun

local gogroup = vim.api.nvim_create_augroup('go', { clear = true })
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead' }, {
    pattern = '*.go',
    group = gogroup,
    command = 'setlocal noexpandtab tabstop=4 shiftwidth=4',
})
vim.api.nvim_create_autocmd({'FileType'}, {
    group = gogroup,
	command = 'nmap <leader>b <Plug>(go-build)',
})

--	autocmd FileType go nmap <leader>b <Plug>(go-build)
--	autocmd FileType go nmap <leader>r <Plug>(go-run)
--	autocmd FileType go nmap <leader>t <Plug>(go-test)
--	autocmd FileType go nmap <leader>f <Plug>(go-test-func)
--	autocmd FileType go nmap <leader>c <Plug>(go-test-compile)
--	autocmd FileType go nmap <leader>l <Plug>(go-metalinter)
--	autocmd FileType go nmap <leader>a :GoAlternate<cr>

-- autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
vim.api.nvim_create_autocmd('FileType', {
    pattern = {'js', 'javascript'},
    command = 'setlocal shiftwidth=2 tabstop=2',
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = {'yaml', 'yml'},
    command = 'setlocal ts=2 sts=2 sw=2',
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = {'sh'},
    command = 'setlocal tabstop=4 shiftwidth=4 sts=4',
})

vim.g.ackprg = 'ag --vimgrep'	-- Use ag instead of ack with ack.vim plugin

vim.api.nvim_create_autocmd('FileType', {
    pattern = {'gohtmltmpl', 'css', 'scss'},
    command = 'setlocal tabstop=2 shiftwidth=2 sts=2',
})

vim.g.terraform_fmt_on_save = 1

-- shortcut to close quickfix window and return to buffer
-- https://vi.stackexchange.com/a/19743
vim.cmd('nnoremap <leader>q :cclose<CR>:TroubleClose<CR>')

-- don't highlight trailing whitespace in terminals
-- https://github.com/ntpeters/vim-better-whitespace/issues/158#issuecomment-1300539929
vim.api.nvim_create_autocmd('TermOpen', {
    pattern = {'*'},
    command = 'DisableWhitespace'
})
