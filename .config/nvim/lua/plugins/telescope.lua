return {
    "nvim-telescope/telescope.nvim",
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
    keys = {
        { "<leader>s", desc = "fuzzily search in current buffer" },
        { "<leader>S", desc = "search by grep" },
        { "<leader>f", desc = "search files" },
        { "<leader>F", desc = "search all files" },
        { "<leader>h", desc = "search help" },
        { "<leader>u", desc = "search undo tree" },
        { "KD", desc = "search diagnostics" },
    },

    config = function()
        require("telescope").setup({})

        require("telescope").load_extension("undo")

        vim.keymap.set("n", "<leader>s", function()
            require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end)
        vim.keymap.set("n", "<leader>S", require("telescope.builtin").live_grep)
        vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files)
        vim.keymap.set("n", "<leader>F", function()
            require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
        end)
        vim.keymap.set("n", "<leader>h", require("telescope.builtin").help_tags)
        vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>")
        vim.keymap.set("n", "KD", require("telescope.builtin").diagnostics)
    end,
}
