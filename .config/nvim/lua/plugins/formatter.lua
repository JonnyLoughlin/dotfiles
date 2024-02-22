return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },

            go = { "goimports", "gofumpt" },
            templ = { "templ" },

            sh = { "shfmt" },
            zsh = { "shfmt" },
        },
        format_on_save = {
            lsp_fallback = true,
            timeout_ms = 1000,
        },
        log_level = vim.log.levels.INFO,
        notify_on_error = true,
    },
}
