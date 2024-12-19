return {
	"mfussenegger/nvim-dap",
	keys = {
		{
			"<F1>",
			function()
				require("dap").continue()
			end,
			desc = "Debug: Start/Continue",
		},
		{
			"<F2>",
			function()
				require("dap").step_into()
			end,
			desc = "Debug: Step Into",
		},
		{
			"<F3>",
			function()
				require("dap").step_over()
			end,
			desc = "Debug: Step Over",
		},
		{
			"<F4>",
			function()
				require("dap").step_out()
			end,
			desc = "Debug: Step Out",
		},
		{
			"<F5>",
			function()
				require("dap").step_back()
			end,
			desc = "Debug: Step Back",
		},
		{
			"<F6>",
			function()
				require("dap").restart()
			end,
			desc = "Debug: Restart",
		},
		{
			"<F7>",
			function()
				require("dap").stop()
			end,
			desc = "Debug: Stop",
		},
		{
			"<F8>",
			function()
				require("dap").disconnect()
			end,
			desc = "Debug: Disconnect",
		},
		{
			"<F9>",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Debug: Toggle Breakpoint",
		},
		{
			"<F10>",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Debug: Set Breakpoint",
		},
		{
			"<F12>",
			function()
				require("dapui").toggle()
			end,
			desc = "Debug: See last session results",
		},
	},
	dependencies = {
		"williamboman/mason.nvim",
		{
			"jay-babu/mason-nvim-dap.nvim",
			opts = {
				automatic_installation = true,
				automatic_setup = true,
			},
		},
		{
			"rcarriga/nvim-dap-ui",
			opts = {
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
			},
		},
		"nvim-neotest/nvim-nio",
	},
	opts = {
		adapters = {
			delve = {
				type = "server",
				port = "${port}",
				executable = {
					command = "dlv",
					args = { "dap", "-l", "127.0.0.1:${port}" },
				},
			},
		},

		configurations = {
			go = {
				{
					type = "delve",
					name = "Debug",
					request = "launch",
					program = "${file}",
				},
				{
					type = "delve",
					name = "Debug test",
					request = "launch",
					mode = "test",
					program = "${file}",
				},
			},
		},
	},
	config = function() end,
}
