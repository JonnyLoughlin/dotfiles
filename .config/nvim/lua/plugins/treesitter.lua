return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	build = ":TSUpdate",
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			injections = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "ga",
					node_incremental = "ga",
					node_decremental = "gd",
					scope_incremental = "gs",
				},
			},
		})
	end,
}
