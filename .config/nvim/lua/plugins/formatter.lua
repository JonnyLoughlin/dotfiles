return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },

      go = { "goimports", "gofumpt" },
      templ = { "templ", "injected" },

      javascript = { "biome" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
      json = { "biome" },

      sh = { "beautysh" },
      zsh = { "beautysh" },
    },
    format_on_save = {
      lsp_fallback = false,
      timeout_ms = 1000,
    },
    log_level = vim.log.levels.INFO,
    notify_on_error = true,
  },
}
