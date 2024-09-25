return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        { "<leader>xe", ":FormatEnable<cr>", noremap = true, desc = "Enable Formatter" },
        { "<leader>xd", ":FormatDisable<cr>", noremap = true, desc = "Disable Formatter" },
    },
    opts = {

        formatters_by_ft = {
            go = { "goimports", "gopls" },

            html = { "prettierd" },

            javascript = { "biome" },
            typescript = { "biome" },
            typescriptreact = { "biome" },

            markdown = { "markdownlint", "injected" },

            lua = { "stylua" },

            bash = { "shfmt" },
            sh = { "shfmt" },

            sql = { "sql_formatter" },

            templ = { "templ" },

            zsh = { "shfmt" },
        },
        format_on_save = function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
            return { timeout_ms = 500, lsp_format = "fallback" }
        end,
        formatters = {
            sql_formatter = {
                prepend_args = { "-c", vim.fn.expand("~/.config/sql-formatter.json") },
            },
        },
        notify_on_error = true,
    },
    init = function()
        vim.api.nvim_create_user_command("FormatDisable", function() vim.g.disable_autoformat = true end, { desc = "Disable autoformat-on-save" })

        vim.api.nvim_create_user_command("FormatEnable", function() vim.g.disable_autoformat = false end, { desc = "Re-enable autoformat-on-save" })
    end,
}
