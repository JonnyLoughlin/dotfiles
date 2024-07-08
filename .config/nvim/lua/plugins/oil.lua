return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>oo", ":Oil --float<cr>", desc = "Open Oil" },
        { "<leader>oc", desc = "Close Oil" },
    },
    config = function()
        require("oil").setup({
            delete_to_trash = true,
            experimental_watch_for_changes = true,
        })
        vim.keymap.set("n", "<leader>oc", require("oil").close)
    end,
}
