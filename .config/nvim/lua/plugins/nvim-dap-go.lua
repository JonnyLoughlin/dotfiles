return {
    "leoluz/nvim-dap-go",
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
