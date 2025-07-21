vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open Parent Directory in Oil" })
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "Format current file" })
vim.keymap.set("n", "<leader>e", "<Cmd>Neotree reveal toggle<CR>")
vim.keymap.set("n", "<leader>s", "<Cmd>Neotree document_symbols right toggle<CR>")
vim.keymap.set("n", "<leader>b", "<Cmd>Neotree buffers right toggle<CR>")
vim.keymap.set("n", "<leader>g", "<Cmd>Neotree git_status right toggle<CR>")
vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
