return {
    "mfussenegger/nvim-lint",
    ft = { "go", "lua", "javascript", "typescript", "typescriptreact", "sh", "bash" },
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            go = { "golangcilint" },

            lua = { "luacheck" },

            javascript = { "biomejs" },
            typescript = { "biomejs" },
            typescriptreact = { "biomejs" },
        }

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            callback = function() lint.try_lint() end,
        })
    end,
}
