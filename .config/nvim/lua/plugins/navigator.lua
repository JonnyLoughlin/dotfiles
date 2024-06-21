return {
    "https://git.sr.ht/~swaits/zellij-nav.nvim",
    keys = {
        { "<A-h>", "<cmd>ZellijNavigateLeft<cr>", { silent = true, desc = "navigate left" } },
        { "<A-j>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "navigate down" } },
        { "<A-k>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "navigate up" } },
        { "<A-l>", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right" } },
    },
    opts = {},
}
