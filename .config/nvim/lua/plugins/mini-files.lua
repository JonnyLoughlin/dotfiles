return {
	"echasnovski/mini.files",
	version = false,
	opts = {
		options = {
			permanent_delete = false,
		},
		windows = {
			preview = true,
			width_preview = 50,
		},
	},
	keys = {
		{
			"<leader>ft",
			function()
				require("mini.files").open()
			end,
			desc = "Open Mini Files",
		},
	},
}
