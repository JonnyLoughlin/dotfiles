return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                go = { "goimports", "gofumpt" },
                gotmpl = { "prettierd" },
                html = { "prettierd" },
                javascript = { "prettierd" },
                lua = { "stylua" },
                sh = { "shfmt" },
                sql = { "sql_formatter" },
                templ = { "templ" },
                typescriptreact = { "prettierd" },
                zsh = { "shfmt" },
            },
            format_on_save = function()
                if not vim.g.disable_autoformat then
                    return { timeout_ms = 500, lsp_format = "fallback" }
                    ---@diagnostic disable-next-line: missing-return
                end
            end,
            notify_on_error = true,
        })

        require("conform").formatters.sql_formatter = { prepend_args = { "-c", vim.fn.expand("~/.config/sql-formatter.json") } }

        -- require("conform").formatters.prettier = {
        --     prepend_args = {
        --         "--plugin",
        --         vim.fn.expand("~/.bun/install/global/node_modules/prettier-plugin-go-template/lib/index.js"),
        --     },
        -- }

        vim.api.nvim_create_user_command("FormatDisable", function()
            vim.g.disable_autoformat = true
        end, { desc = "Disable autoformat-on-save" })

        vim.api.nvim_create_user_command("FormatEnable", function()
            vim.g.disable_autoformat = false
        end, { desc = "Re-enable autoformat-on-save" })

        vim.keymap.set("n", "<leader>xe", ":FormatEnable<cr>", { noremap = true, desc = "Enable Formatter" })
        vim.keymap.set("n", "<leader>xd", ":FormatDisable<cr>", { noremap = true, desc = "Disable Formatter" })
    end,
}
