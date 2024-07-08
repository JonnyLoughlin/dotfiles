return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
        local wk = require("which-key")
        wk.register({
            c = { name = "Comment" },
            g = { name = "Gitsigns" },
            o = { name = "Oil" },
            p = { name = "Peek" },
            v = { name = "Go Snippets" },
            x = { name = "Conform" },
            y = { name = "You Surround" },
        }, { prefix = "<leader>" })
        wk.register({
            K = { name = "LSP" },
        })
    end,
}
