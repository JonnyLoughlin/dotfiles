return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",

      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",

      "leoluz/nvim-dap-go",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("mason-nvim-dap").setup({
        automatic_installation = true,
        automatic_setup = true,
      })

      -- Basic debugging keymaps
      vim.keymap.set("n", "<F6>", dap.continue, { desc = "Debug: Start/Continue" })
      vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
      vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
      vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
      vim.keymap.set("n", "<F4>", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
      vim.keymap.set("n", "<F5>", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Debug: Set Breakpoint" })
      vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
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

        controls = {
          icons = {
            pause = "󰏤",
            play = "▶",
            step_into = "󰆹",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "▶▶",
            terminate = "",
            disconnect = "⏏",
          },
        },
      })

      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      dap.listeners.before.event_exited["dapui_config"] = dapui.close

      require("dap-go").setup()
    end,
  },
}
