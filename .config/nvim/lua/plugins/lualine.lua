return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = true,
			theme = "tokyonight",
		},
		extensions = { "lazy", "mason", "nvim-dap-ui" },
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "filename" },
			lualine_c = { { "diagnostics", always_visible = true } },
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	},
}
