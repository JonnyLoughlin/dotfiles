return {
    "OXY2DEV/markview.nvim",
    ft = "markdown",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>md", ":Markview disable<cr>", desc = "Disable Markdown Preview" },
        { "<leader>me", ":Markview enable<cr>", desc = "Enable Markdown Preview" },
    },
}