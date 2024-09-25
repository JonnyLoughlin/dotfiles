return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
        numhl = true,
        current_line_blame_opts = {
            delay = 100,
        },
    },
    keys = {
        { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Show Git Diff" },
        { "<leader>gp", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Show Git Hunk Preview Inline" },
        { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Git Currrent Line Blame" },
    },
}
