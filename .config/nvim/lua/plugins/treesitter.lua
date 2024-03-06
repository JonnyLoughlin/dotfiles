return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context",
            "windwp/nvim-ts-autotag",
        },
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                highlight = { enable = true, additional_vim_regex_highlighting = true },
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

            require("nvim-treesitter.configs").setup({
                autotag = {
                    enable = true,
                    enable_rename = true,
                    enable_close = true,
                    enable_close_on_slash = true,
                    filetypes = { "html", "templ", "gotmpl" },
                },
            })

            vim.treesitter.language.register("gotmpl", "gohtmltmpl")

            -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            -- parser_config.gotmpl = {
            --     install_info = {
            --         url = "https://github.com/ngalaiko/tree-sitter-go-template",
            --         files = { "src/parser.c" },
            --     },
            --     filetype = "gohtmltmpl",
            --     used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" },
            -- }
            -- vim.filetype.add({ extension = { tmpl = "gohtmltmpl" } })
        end,
    },
}
