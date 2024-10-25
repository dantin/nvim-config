return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
		},
		config = function()
			-- import nvim-treesitter plugin.
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({
				-- enable syntax highlighting.
				highlight = {
					enable = true,
				},
				-- enable indentation.
				indent = { enable = true },
				-- enable autotagging (w/nvims-ts-autotag plugin).
				autotag = {
					enable = true,
				},
				-- ensure these language parsers are installed
				ensure_installed = {
					"c",
					"cmake",
					"cpp",
					"css",
					"dockerfile",
					"go",
					"html",
					"javascript",
					"lua",
					"make",
					"python",
					"query",
					"vim",
					"vimdoc",
					"yaml",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
				-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx.
				-- require("ts_context_commentstring").setup {}
			})
		end,
	},
}
