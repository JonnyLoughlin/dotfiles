-- tailwind-tools.lua
return {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
        "neovim/nvim-lspconfig",
    },
    ft = { "html", "templ" },
    keys = {
        { "<leader>tt", "<cmd>TailwindConcealToggle<cr>", { desc = "toggle tailwind conceal" } },
    },
    config = function()
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.templ",
            callback = function() require("tailwind-tools.lsp").sort_classes(true) end,
        })

        require("tailwind-tools").setup({
            document_color = {
                inline_symbol = "󰝤",
            },
        })
    end,
}
