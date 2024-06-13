return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
    },
    config = function()
        require("telescope").setup({})

        require("telescope").load_extension("undo")

        vim.keymap.set("n", "<leader>s", function()
            require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, { desc = "fuzzily search in current buffer" })
        vim.keymap.set("n", "<leader>S", require("telescope.builtin").live_grep, { desc = "search by grep" })
        vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files, { desc = "search files" })
        vim.keymap.set("n", "<leader>F", function()
            require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
        end, { desc = "search all files" })
        vim.keymap.set("n", "<leader>h", require("telescope.builtin").help_tags, { desc = "search help" })
        vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "search undo tree" })
        vim.keymap.set("n", "KD", require("telescope.builtin").diagnostics, { desc = "search diagnostics" })
    end,
}
