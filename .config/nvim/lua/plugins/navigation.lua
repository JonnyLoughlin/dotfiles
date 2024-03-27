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
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "s1n7ax/nvim-window-picker",
        },
        config = function()
            vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
            vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
            vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
            vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
            require("neo-tree").setup({
                enable_git_status = true,
                enable_diagnostics = true,
                window = { position = "current" },
                filesystem = { filtered_items = { hide_by_pattern = { "*/*_templ*" } } },
                default_component_configs = {
                    git_status = {
                        symbols = {
                            added = "✚",
                            modified = "",
                            deleted = "✖",
                            renamed = "",
                            untracked = "",
                            ignored = "",
                            unstaged = "",
                            staged = "",
                            conflict = "",
                        },
                    },
                },
            })

            vim.keymap.set("n", "<leader>n", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true, desc = "NeoTree toggle" })
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
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup({ opts = { use_diagnostic_signs = true } })

            vim.keymap.set("n", "<leader>tt", ":TroubleToggle<cr>", { desc = "Toggle Trouble" })
        end,
    },
}
