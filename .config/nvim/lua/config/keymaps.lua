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

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
