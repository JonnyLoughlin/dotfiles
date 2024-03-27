return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },

                css = { "cssls" },

                go = { "goimports", "gofumpt", "injected" },

                templ = { "templ", "injected" },

                sql = { "sql_formatter" },

                html = { "prettier" },
                javascript = { "biome" },
                gohtmltmpl = { "prettier" },
                typescriptreact = { "prettier" },

                sh = { "shfmt" },
                zsh = { "shfmt" },
            },
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 1000,
            },
            notify_on_error = true,
        })

        require("conform").formatters.sql_formatter = { prepend_args = { "-c", vim.fn.expand("~/.config/sql-formatter.json") } }

        require("conform").formatters.injected = {
            options = {
                ignore_errors = false,
                lang_to_ext = {
                    javascript = "js",
                    typescript = "ts",
                },
            },
        }
    end,
}
