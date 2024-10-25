return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            highlight = { enable = true },
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
            textobjects = {
                select = {
                    enable = true,
                    keymaps = {
                        ["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
                        ["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
                        ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                    },
                },
            },
        })
    end,
}
