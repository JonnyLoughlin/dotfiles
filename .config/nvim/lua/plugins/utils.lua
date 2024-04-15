return {
    {
        "folke/which-key.nvim",
        config = function()
            local wk = require("which-key")
            wk.register({
                ["<leader>"] = { name = "search" },
                c = { name = "[c]omment" },
                l = { name = "[l]sp" },
                y = { name = "[y]ou surround" },
            }, { prefix = "<leader>" })
        end,
    },
    {
        -- autopairs
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    {
        -- Surround Motions
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                keymaps = {
                    normal = "<leader>ys",
                    normal_line = "<leader>yS",
                    normal_cur = "<leader>yr",
                    normal_cur_line = "<leader>yR",
                    visual = "<leader>ys",
                    visual_line = "<leader>yS",
                    change = "<leader>yc",
                    change_line = "<leader>yC",
                    delete = "<leader>yd",
                    insert = false,
                    insert_line = false,
                },
            })
        end,
    },
    {
        -- Configure comment toggler
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({
                toggler = {
                    line = "<leader>cl",
                    block = "<leader>cb",
                },
                opleader = {
                    line = "<leader>cl",
                    block = "<leader>cb",
                },
                extra = {
                    above = "<leader>cO",
                    below = "<leader>co",
                    eol = "<leader>cA",
                },
            })
            require("Comment.ft").set("templ", "//%s")
        end,
    },
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    {
        "rest-nvim/rest.nvim",
        ft = "http",
        dependencies = { "luarocks.nvim" },
        config = function()
            require("rest-nvim").setup({})
        end,
    },
}
