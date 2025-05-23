return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	ft = "markdown",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>md", ":Markview disable<cr>", desc = "Disable Markdown Preview" },
		{ "<leader>me", ":Markview enable<cr>", desc = "Enable Markdown Preview" },
	},
}
