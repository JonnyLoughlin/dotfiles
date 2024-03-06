return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },

            go = { "goimports", "gofumpt", "injected" },

            templ = { "templ" },

            sql = { "sqlfmt" },

            html = { "prettier" },
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
    },
}
