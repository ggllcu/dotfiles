require("core.keymaps")
require("core.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.auto_session"),
	require("plugins.btw"),
	require("plugins.cmp"),
	require("plugins.conform"),
	require("plugins.github_theme"),
	require("plugins.gitsign"),
	require("plugins.leap"),
	require("plugins.lsp"),
	require("plugins.lualine"),
	require("plugins.markdown"),
	require("plugins.neoscroll"),
	require("plugins.neotest"),
	require("plugins.neotree"),
	require("plugins.oil"),
	require("plugins.screenkey"),
	require("plugins.surround"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.which_key"),
})
