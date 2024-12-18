return {
    "saghen/blink.cmp",
    build = "cargo build --release",
    dependencies = {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    },
    opts = {
        keymap = { preset = "default" },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },

        sources = {
            default = { "lsp", "path", "buffer", "lazydev" },
            providers = {
                lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
            },
        },

        completion = {
            documentation = {
                auto_show = true,
            },
        },

        signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
}
