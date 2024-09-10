return {
    "GR3YH4TT3R93/zellij-nav.nvim",
    lazy = false,
    init = function() -- Only needed if you want to override default keymaps otherwise just call opts = {}
        vim.g.zellij_nav_default_mappings = false -- Default: true
    end,
    opts = {}, -- Optional
    keys = {
        { "<A-h>", "<cmd>ZellijNavigateLeft<CR>", { silent = true } },
        { "<A-j>", "<cmd>ZellijNavigateDown<CR>", { silent = true } },
        { "<A-k>", "<cmd>ZellijNavigateUp<CR>", { silent = true } },
        { "<A-l>", "<cmd>ZellijNavigateRight<CR>", { silent = true } },
        { "<A-n>", "<cmd>ZellijNewPane<CR>", { silent = true } },
        { "<A-x>", "<cmd>ZellijNewPaneSplit<CR>", { silent = true } },
        { "<A-v>", "<cmd>ZellijNewPaneVSplit<CR>", { silent = true } },
        { "<A-S-t>", "<cmd>ZellijNewTab<CR>", { silent = true } },
    }, -- define your own keymaps e.g keys = { { "<C-h>", "<cmd>ZellijNavigateUp<CR>", { silent = true, desc = "Move to Zellij pane up" } } }
}
