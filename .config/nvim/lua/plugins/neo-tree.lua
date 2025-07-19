return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- Optional image support for file preview: See `# Preview Mode` for more information.
		-- {"3rd/image.nvim", opts = {}},
		-- OR use snacks.nvim's image module:
		-- "folke/snacks.nvim",
	},
	lazy = false, -- neo-tree will lazily load itself
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
			},
			sources = {
				"filesystem",
				"buffers",
				"git_status",
				"document_symbols",
			},
			document_symbols = {
				kinds = {
					File = { icon = "󰈙", hl = "Tag" },
					Namespace = { icon = "󰌗", hl = "Include" },
					Package = { icon = "󰏖", hl = "Label" },
					Class = { icon = "󰌗", hl = "Include" },
					Method = { icon = "󰆧", hl = "Function" },
					Property = { icon = "󰜢", hl = "Identifier" },
					Field = { icon = "󰜢", hl = "Identifier" },
					Constructor = { icon = "󰆧", hl = "Function" },
					Enum = { icon = "󰒻", hl = "Type" },
					Interface = { icon = "󰜰", hl = "Type" },
					Function = { icon = "󰆧", hl = "Function" },
					Variable = { icon = "󰀫", hl = "Constant" },
					Constant = { icon = "󰏿", hl = "Constant" },
					String = { icon = "󰀬", hl = "String" },
					Number = { icon = "󰎠", hl = "Number" },
					Boolean = { icon = "⊨", hl = "Boolean" },
					Array = { icon = "󰅪", hl = "Constant" },
					Object = { icon = "󰅩", hl = "Type" },
					Key = { icon = "󰌋", hl = "Type" },
					Null = { icon = "󰟢", hl = "Type" },
					EnumMember = { icon = "󰕘", hl = "Constant" },
					Struct = { icon = "󰌗", hl = "Structure" },
					Event = { icon = "󰉁", hl = "Type" },
					Operator = { icon = "󰆕", hl = "Identifier" },
					TypeParameter = { icon = "󰊄", hl = "Identifier" },
				},
			},
		})
	end,
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {
		-- add options here
	},
}
