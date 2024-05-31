return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            toggler = {
                line = "<leader>cl",
                block = "<leader>cb",
            },
            opleader = {
                line = "<leader>cl",
                block = "<leader>cb",
            },
            extra = {
                above = "<leader>cO",
                below = "<leader>co",
                eol = "<leader>cA",
            },
        })
        require("Comment.ft").set("templ", "//%s")
    end,
}
