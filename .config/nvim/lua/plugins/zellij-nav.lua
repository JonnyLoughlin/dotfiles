return {
	-- "GR3YH4TT3R93/zellij-nav.nvim",
	dir = "~/proj/zellij-nav.nvim/",
	lazy = false,
	init = function()
		vim.g.zellij_nav_default_mappings = false
	end,
	opts = {},
	keys = {
		{ "<A-h>", "<cmd>ZellijNavigateLeft<CR>", { silent = true } },
		{ "<A-j>", "<cmd>ZellijNavigateDown<CR>", { silent = true } },
		{ "<A-k>", "<cmd>ZellijNavigateUp<CR>", { silent = true } },
		{ "<A-l>", "<cmd>ZellijNavigateRight<CR>", { silent = true } },
		{ "<A-x>", "<cmd>ZellijNewPaneSplit<CR>", { silent = true } },
		{ "<A-v>", "<cmd>ZellijNewPaneVSplit<CR>", { silent = true } },
		{ "<A-S-v>", "<cmd>ZellijNewTab<CR>", { silent = true } },
		{ "<A-o>", "<cmd>ZellijToggleFloatingPanes<CR>", { silent = true } },
	},
}
