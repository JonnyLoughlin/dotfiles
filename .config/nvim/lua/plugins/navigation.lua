return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
        },
        config = function()
            require("telescope").setup({})

            require("telescope").load_extension("undo")

            vim.keymap.set("n", "<leader>s", require("telescope.builtin").current_buffer_fuzzy_find, { desc = "fuzzy search in current buffer" })
            vim.keymap.set("n", "<leader><S-S>", require("telescope.builtin").live_grep, { desc = "search by grep" })
            vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files, { desc = "search files" })
            vim.keymap.set("n", "<leader><S-f>", function()
                require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
            end, { desc = "search all files" })
            vim.keymap.set("n", "<leader>d", require("telescope.builtin").diagnostics, { desc = "search diagnostics" })
            vim.keymap.set("n", "<leader>h", require("telescope.builtin").help_tags, { desc = "search help" })
            vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "search undo tree" })
            vim.keymap.set("n", "<leader>r", require("telescope.builtin").buffers, { desc = "search open buffers" })
        end,
    },
    {
        "sindrets/winshift.nvim",
        event = "VeryLazy",
        config = function()
            require("winshift").setup({})
            vim.keymap.set("n", "<C-n>", ":WinShift<cr>", { noremap = true, silent = true, desc = "toggle WinShift mode" })
        end,
    },
    {
        "nvim-zh/colorful-winsep.nvim",
        event = { "WinNew" },
        config = function()
            require("colorful-winsep").setup({})
        end,
    },
}
