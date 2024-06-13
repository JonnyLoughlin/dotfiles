return {
    "leoluz/nvim-dap-go",
    event = "VeryLazy",
    config = function()
        require("dap-go").setup({
            dap_configurations = {
                {
                    type = "go",
                    name = "Attach remote",
                    mode = "remote",
                    request = "attach",
                },
            },
        })
    end,
}
