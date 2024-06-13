return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "windwp/nvim-ts-autotag",
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
        })

        vim.treesitter.language.register("gotmpl", "tmpl")
    end,
}
