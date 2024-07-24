return {
    "laytan/tailwind-sorter.nvim",
    ft = { "javascript", "javascripttreact", "typescript", "typescriptreact", "html", "templ" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    build = "cd formatter && npm ci && npm run build",
    opts = {
        on_save_enabled = true,
        on_save_pattern = { "*.html", "*.jsx", "*.tsx", "*.templ" },
    },
}
