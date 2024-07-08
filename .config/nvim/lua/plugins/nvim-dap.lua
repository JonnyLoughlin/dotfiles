return {
    "mfussenegger/nvim-dap",
    keys = {
        { "<F1>", desc = "Debug: Start/Continue" },
        { "<F2>", desc = "Debug: Step Into" },
        { "<F3>", desc = "Debug: Step Over" },
        { "<F4>", desc = "Debug: Step Out" },
        { "<F5>", desc = "Debug: Step Back" },
        { "<F6>", desc = "Debug: Restart" },
        { "<F7>", desc = "Debug: Stop" },
        { "<F8>", desc = "Debug: Disconnect" },
        { "<F9>", desc = "Debug: Toggle Breakpoint" },
        { "<F10>", desc = "Debug: Set Breakpoint" },
        { "<F12>", desc = "Debug: See last session results" },
    },
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

        vim.keymap.set("n", "<F1>", dap.continue)
        vim.keymap.set("n", "<F2>", dap.step_into)
        vim.keymap.set("n", "<F3>", dap.step_over)
        vim.keymap.set("n", "<F4>", dap.step_out)
        vim.keymap.set("n", "<F5>", dap.step_back)
        vim.keymap.set("n", "<F6>", dap.restart)
        vim.keymap.set("n", "<F7>", dap.stop)
        vim.keymap.set("n", "<F8>", dap.disconnect)
        vim.keymap.set("n", "<F9>", dap.toggle_breakpoint)
        vim.keymap.set("n", "<F10>", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end)
        vim.keymap.set("n", "<F12>", dapui.toggle)

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

        dap.adapters.delve = {
            type = "server",
            port = "${port}",
            executable = {
                command = "dlv",
                args = { "dap", "-l", "127.0.0.1:${port}" },
                -- add this if on windows, otherwise server won't open successfully
                -- detached = false
            },
        }

        -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
        dap.configurations.go = {
            {
                type = "delve",
                name = "Debug",
                request = "launch",
                program = "${file}",
            },
            {
                type = "delve",
                name = "Debug test", -- configuration for debugging test files
                request = "launch",
                mode = "test",
                program = "${file}",
            },
            -- works with go.mod packages and sub packages
            {
                type = "delve",
                name = "Debug test (go.mod)",
                request = "launch",
                mode = "test",
                program = "./${relativeFileDirname}",
            },
        }
    end,
}
