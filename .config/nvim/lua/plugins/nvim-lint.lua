return {
    "mfussenegger/nvim-lint",
    ft = { "go", "lua", "javascript", "typescript", "typescriptreact" },
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            go = { "golangcilint" },

            lua = { "luacheck" },

            javascript = { "biomejs" },
            typescript = { "biomejs" },
            typescriptreact = { "biomejs" },

            sh = { "shellcheck" },
        }

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            callback = function() lint.try_lint() end,
        })
    end,
}
