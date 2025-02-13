return {
	"saghen/blink.cmp",
	build = "cargo build --release",
	dependencies = {
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	opts = {
		sources = {
			default = { "lsp", "path", "buffer", "lazydev" },
			providers = {
				lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
			},
		},

		completion = {
			keyword = { range = "full" },
			trigger = {
				prefetch_on_insert = false,
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},
			ghost_text = { enabled = true },
			menu = {
				max_height = 20,
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "source_name" },
					},
				},
			},
		},

		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
