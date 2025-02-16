-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- [Shift-]Page up/down exits terminal mode and scrolls up/down
vim.keymap.set("t", "<PageUp>", "<c-\\><c-n><PageUp>")
vim.keymap.set("t", "<PageDown>", "<c-\\><c-n><PageDown>")
vim.keymap.set("t", "<S-PageUp>", "<c-\\><c-n><PageUp>")
vim.keymap.set("t", "<S-PageDown>", "<c-\\><c-n><PageDown>")

-- Escape key exits terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
