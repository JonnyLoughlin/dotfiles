return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.icons").setup({})

			require("mini.files").setup({
				options = {
					permanent_delete = false,
				},
				windows = {
					preview = true,
					width_preview = 50,
				},
			})
			vim.keymap.set("n", "<leader>ft", "<cmd>lua MiniFiles.open()<cr>")

			require("mini.pairs").setup({})

			require("mini.surround").setup({
				mappings = {
					add = "<leader>ys",
					delete = "<leader>yd",
					replace = "<leader>yc",
					find = "",
					find_left = "",
					highlight = "",
					update_n_lines = "",
					suffix_last = "",
					suffix_next = "",
				},
			})

			require("mini.statusline").setup({
				content = {
					active = function()
						local MiniStatusline = require("mini.statusline")
						local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 20 })
						local git = MiniStatusline.section_git({ trunc_width = 20 })
						local diff = MiniStatusline.section_diff({ trunc_width = 20 })
						local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 20 })
						local lsp = MiniStatusline.section_lsp({ trunc_width = 20 })
						local filename = MiniStatusline.section_filename({ trunc_width = 170 })
						local location = MiniStatusline.section_location({ trunc_width = 20 })
						local search = MiniStatusline.section_searchcount({ trunc_width = 20 })

						return MiniStatusline.combine_groups({
							{ hl = mode_hl, strings = { mode } },
							{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
							"%<", -- Mark general truncate point
							{ hl = "MiniStatuslineFilename", strings = { filename } },
							"%=", -- End left alignment
							{ hl = "MiniStatuslineFileinfo", strings = { search, location } },
						})
					end,
					inactive = function()
						local MiniStatusline = require("mini.statusline")
						local filename = MiniStatusline.section_filename({ trunc_width = 2000 })

						return MiniStatusline.combine_groups({
							"%<", -- Mark general truncate point
							{ hl = "MiniStatuslineFilename", strings = { filename } },
							"%=", -- End left alignment
						})
					end,
				},
			})

			require("mini.git").setup({})
			require("mini.diff").setup({})
			vim.keymap.set("n", "<leader>go", "<cmd>lua MiniDiff.toggle_overlay()<cr>")
		end,
	},
}
