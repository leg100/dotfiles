-- set leader key to comma
vim.g.mapleader = ','

local keymap = vim.keymap -- for conciseness

-- double-tap escape to unhighlight search terms
keymap.set('n', '<esc><esc>', '<cmd>nohlsearch<cr>', { silent = true })
