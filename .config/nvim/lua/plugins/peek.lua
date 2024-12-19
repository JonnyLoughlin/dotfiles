return {
	"toppair/peek.nvim",
	build = "deno task --quiet build:fast",
	ft = { "markdown" },
	keys = {
		{
			"<leader>po",
			function()
				require("peek").open()
			end,
			desc = "Open Peek",
		},
		{
			"<leader>pc",
			function()
				require("peek").close()
			end,
			desc = "Close Close",
		},
	},
	opts = {
		app = "browser",
	},
}
