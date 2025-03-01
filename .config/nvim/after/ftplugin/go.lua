vim.opt_local.formatoptions = "rocqj" -- Auto-add // after hitting return or 'o'
vim.opt_local.textwidth = 80 -- Wrap text after 80 columns
vim.api.nvim_buf_set_keymap(0, "n", "<leader>a", "<cmd>GoAlt<cr>", { silent = true })
vim.api.nvim_buf_set_keymap(0, "n", "<leader>b", "<cmd>GoBuild<cr>", { silent = true })
vim.api.nvim_buf_set_keymap(0, "n", "<leader>r", "<cmd>GoRun<cr>", { silent = true })
vim.api.nvim_buf_set_keymap(0, "n", "<leader>t", "<cmd>GoTest<cr>", { silent = true })
vim.api.nvim_buf_set_keymap(0, "n", "<leader>f", "<cmd>GoTestFunc<cr>", { silent = true })
vim.api.nvim_buf_set_keymap(0, "n", "<leader>c", "<cmd>GoTestCompile<cr>", { silent = true })
vim.api.nvim_buf_set_keymap(0, "n", "<leader>l", "<Plug>(go-metalinter)", { silent = true })

if _G.MiniSplitjoin ~= nil then
	local gen_hook = MiniSplitjoin.gen_hook
	local parens = { brackets = { "%b()" } }
	local curly = { brackets = { "%b{}" } }

	-- Add trailing comma when splitting inside parenthesis
	local add_comma_parens = gen_hook.add_trailing_separator(parens)

	-- Delete trailing comma when joining inside parenthesis
	local del_comma_parens = gen_hook.del_trailing_separator(parens)

	-- Add trailing comma when splitting inside curly brackets
	local add_comma_curly = gen_hook.add_trailing_separator(curly)

	-- Delete trailing comma when joining inside curly brackets
	local del_comma_curly = gen_hook.del_trailing_separator(curly)

	vim.b.minisplitjoin_config = {
		split = { hooks_post = { add_comma_parens, add_comma_curly } },
		join = { hooks_post = { del_comma_parens, del_comma_curly } },
	}
end
