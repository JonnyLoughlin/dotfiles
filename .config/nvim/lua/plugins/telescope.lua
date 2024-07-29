return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function() return vim.fn.executable("make") == 1 end,
        },
    },
    keys = {
        { "<leader>s", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "fuzzily search in current buffer" },
        { "<leader>S", "<cmd>Telescope live_grep<cr>", desc = "search by grep" },
        { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "search files" },
        { "<leader>F", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", desc = "search all files" },
        { "<leader>h", "<cmd>Telescope help_tags<cr>", desc = "search help" },
        { "<leader>u", "<cmd>Telescope undo<CR>", desc = "search undo tree" },
        { "KD", "<cmd>Telescope diagnostics<cr>", desc = "search diagnostics" },
    },

    config = function()
        require("telescope").load_extension("undo")
        require("telescope").setup({
            pickers = {
                current_buffer_fuzzy_find = {
                    theme = "dropdown",
                    previewer = false,
                    layout_config = {
                        height = 0.8,
                        width = 0.8,
                    },
                },
            },
        })
    end,
}
