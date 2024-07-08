return {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    keys = {
        { "<leader>po", ":PeekOpen<cr>", desc = "Open Peek" },
        { "<leader>pc", ":PeekClose<cr>", desc = "Close Close" },
    },
    config = function()
        require("peek").setup({
            app = "browser",
        })
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
}
