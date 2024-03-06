return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = true,
                terminal_colors = true,
                styles = { sidebars = "transparent" },
                on_highlights = function(hl, c)
                    hl.FloatBorder = { fg = c.none, bg = c.none }
                end,
            })
            vim.cmd.colorscheme("tokyonight-storm")
            vim.cmd.hi("Comment gui=none")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = "tokyonight",
                    component_separators = { left = "|", right = "|" },
                    section_separators = { left = "", right = "" },
                },
                extensions = { "lazy", "mason", "nvim-dap-ui", "neo-tree" },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "filename" },
                    lualine_c = { "diff", { "diagnostics", always_visible = true } },
                    lualine_x = { "tree-sitter" },
                    lualine_y = {},
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = { "filename" },
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {},
                },
            })
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "-" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },
}
