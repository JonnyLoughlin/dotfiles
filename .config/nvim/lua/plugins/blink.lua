-- return {
-- 	"saghen/blink.cmp",
-- 	build = "cargo build --release",
-- 	dependencies = {
-- 		"folke/lazydev.nvim",
-- 		ft = "lua",
-- 		opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
-- 	},
-- 	opts = {
-- 		keymap = { preset = "default" },
-- 		appearance = {
-- 			use_nvim_cmp_as_default = true,
-- 			nerd_font_variant = "mono",
-- 		},
--
-- 		sources = {
-- 			default = { "lsp", "path", "buffer", "lazydev" },
-- 			providers = {
-- 				lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
-- 			},
-- 		},
--
-- 		completion = {
-- 			documentation = {
-- 				auto_show = true,
-- 			},
-- 			keyword = {
-- 				range = "full",
-- 			},
-- 			trigger = {
-- 				prefetch_on_insert = true,
-- 				show_on_blocked_trigger_characters = function()
-- 					return {}
-- 					-- if vim.api.nvim_get_mode().mode == "c" then
-- 					-- end
-- 					--
-- 					-- -- you can also block per filetype, for example:
-- 					-- -- if vim.bo.filetype == 'markdown' then
-- 					-- --   return { ' ', '\n', '\t', '.', '/', '(', '[' }
-- 					-- -- end
-- 					--
-- 					-- return { " ", "\n", "\t" }
-- 				end,
-- 			},
-- 		},
--
-- 		signature = { enabled = true },
-- 	},
-- 	opts_extend = { "sources.default" },
-- }
return {
	"iguanacucumber/magazine.nvim",
	name = "nvim-cmp",
	dependencies = {
		{ "iguanacucumber/mag-nvim-lsp", name = "cmp-nvim-lsp", opts = {} },
		{ "iguanacucumber/mag-buffer", name = "cmp-buffer" },
		{ "iguanacucumber/mag-cmdline", name = "cmp-cmdline" },
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-path",
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			opts = {},
		},
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			completion = { completeopt = "menu,menuone,noinsert" },

			preselect = cmp.PreselectMode.None,

			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-j>"] = cmp.mapping.scroll_docs(1),
				["<C-k>"] = cmp.mapping.scroll_docs(-1),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "lazydev", group_index = 0 },
				{ name = "nvim_lsp_signature_help" },
				{ name = "path" },
			}),

			formatting = {
				format = function(entry, vim_item)
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						buffer = "[Buffer]",
						path = "[Path]",
					})[entry.source.name]
					return vim_item
				end,
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = { { name = "buffer" } },
		})

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
