return {
    "dynamotn/Navigator.nvim",
    config = function()
        require("Navigator").setup({})
        vim.keymap.set({ "n", "t" }, "<A-h>", "<cmd>NavigatorLeft<cr>")
        vim.keymap.set({ "n", "t" }, "<A-l>", "<cmd>NavigatorRight<cr>")
        vim.keymap.set({ "n", "t" }, "<A-k>", "<cmd>NavigatorUp<cr>")
        vim.keymap.set({ "n", "t" }, "<A-j>", "<cmd>NavigatorDown<cr>")
    end,
}
