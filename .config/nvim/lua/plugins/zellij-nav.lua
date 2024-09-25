return {
    -- "GR3YH4TT3R93/zellij-nav.nvim",
    dir = "~/proj/zellij-nav.nvim/",
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
        { "<A-x>", "<cmd>ZellijNewPaneSplit<CR>", { silent = true } },
        { "<A-v>", "<cmd>ZellijNewPaneVSplit<CR>", { silent = true } },
        { "<A-S-v>", "<cmd>ZellijNewTab<CR>", { silent = true } },
        { "<A-o>", "<cmd>ZellijToggleFloatingPanes<CR>", { silent = true } },
    },
}
--
-- return {
--     {
--         "https://github.com/fresh2dev/zellij.vim.git",
--         lazy = false,
--         keys = {
--             { "<A-h>", "<cmd>ZellijNavigateLeft<CR>", { silent = true } },
--             { "<A-j>", "<cmd>ZellijNavigateDown<CR>", { silent = true } },
--             { "<A-k>", "<cmd>ZellijNavigateUp<CR>", { silent = true } },
--             { "<A-l>", "<cmd>ZellijNavigateRight<CR>", { silent = true } },
--             { "<A-x>", "<cmd>ZellijNewPaneSplit<CR>", { silent = true } },
--             { "<A-v>", "<cmd>ZellijNewPaneVSplit<CR>", { silent = true } },
--             { "<A-S-v>", "<cmd>ZellijNewTab<CR>", { silent = true } },
--             { "<A-o>", "<cmd>ZellijToggleFloatingPanes<CR>", { silent = true } },
--         },
--     },
-- }
