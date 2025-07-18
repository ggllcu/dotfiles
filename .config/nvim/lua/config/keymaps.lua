vim.keymap.set("n", "-", "<cmd>Oil<CR>", {desc="Open Parent Directory in Oil"})
vim.keymap.set("n", "<leader>cf", function()
    require("conform").format({
        lsp_format = "fallback",
    })
end, { desc = "Format current file" })
