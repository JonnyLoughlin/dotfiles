return {
    "mfussenegger/nvim-dap",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("mason-nvim-dap").setup({
            automatic_installation = true,
            automatic_setup = true,
        })

        vim.keymap.set("n", "<F1>", dap.continue, { desc = "Debug: Start/Continue" })
        vim.keymap.set("n", "<F2>", dap.step_into, { desc = "Debug: Step Into" })
        vim.keymap.set("n", "<F3>", dap.step_over, { desc = "Debug: Step Over" })
        vim.keymap.set("n", "<F4>", dap.step_out, { desc = "Debug: Step Out" })
        vim.keymap.set("n", "<F5>", dap.step_back, { desc = "Debug: Step Back" })
        vim.keymap.set("n", "<F6>", dap.restart, { desc = "Debug: Restart" })
        vim.keymap.set("n", "<F7>", dap.stop, { desc = "Debug: Stop" })
        vim.keymap.set("n", "<F8>", dap.disconnect, { desc = "Debug: Disconnect" })
        vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
        vim.keymap.set("n", "<F10>", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "Debug: Set Breakpoint" })
        vim.keymap.set("n", "<F12>", dapui.toggle, { desc = "Debug: See last session result." })

        dapui.setup({
            layouts = {
                {
                    elements = {
                        { id = "breakpoints", size = 0.10 },
                        { id = "watches", size = 0.45 },
                        { id = "scopes", size = 0.45 },
                    },
                    position = "left",
                    size = 80,
                },
                {
                    elements = {
                        { id = "repl", size = 1 },
                    },
                    position = "bottom",
                    size = 20,
                },
            },
        })
        dap.listeners.after.event_initialized["dapui_config"] = dapui.open
        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close
    end,
}
