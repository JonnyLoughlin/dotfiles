return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>oo", function() require("oil").open_float() end, desc = "Open Oil" },
        { "<leader>oc", function() require("oil").close() end, desc = "Close Oil" },
    },
    opts = {
        delete_to_trash = true,
        experimental_watch_for_changes = true,
    },
}
