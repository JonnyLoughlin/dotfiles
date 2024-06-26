return {
    "sindrets/winshift.nvim",
    event = "VeryLazy",
    config = function()
        require("winshift").setup({})
        vim.keymap.set("n", "<C-w>n", ":WinShift<cr>", { noremap = true, silent = true, desc = "toggle WinShift mode" })
    end,
}
