return {
    "folke/trouble.nvim",
    opts = {
        modes = {
            diagnostics = {
                mode = "diagnostics",
                preview = {
                    type = "split",
                    relative = "win",
                    position = "right",
                    size = 0.3,
                },
            },
        },
    },
    cmd = "Trouble",
    keys = {
        {
            "<leader>tt",
            "<cmd>Trouble diagnostics toggle focus=true refresh=true<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>tT",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>ts",
            "<cmd>Trouble lsp_document_symbols toggle focus=true win.size=0.5 win.position=right<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>tl",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
    },
}
