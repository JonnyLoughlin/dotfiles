return {
    "mfussenegger/nvim-lint",
    ft = { "go", "lua", "javascript", "typescript", "typescriptreact" },
    opts = {
        linters_by_ft = {
            go = { "golangcilint" },

            lua = { "luacheck" },

            javascript = { "biomejs" },
            typescript = { "biomejs" },
            typescriptreact = { "biomejs" },

            sh = { "shellcheck" },
        },
    },
    config = function()
        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function() require("lint").try_lint() end,
        })
    end,
}
