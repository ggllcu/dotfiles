vim.lsp.config('lua_ls')
vim.lsp.enable("lua_ls")

-- Diagnostics
vim.diagnostic.config({
	-- Use the default configuration
	-- virtual_lines = true

	-- Alternatively, customize specific options
	virtual_lines = {
		-- Only show virtual line diagnostics for the current cursor line
		current_line = true,
	},
})
