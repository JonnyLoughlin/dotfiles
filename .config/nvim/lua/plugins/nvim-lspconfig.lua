return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "saghen/blink.cmp" },
		{ "artemave/workspace-diagnostics.nvim" },
		{
			"nanotee/sqls.nvim",
			ft = { "sql" },
			keys = {
				{ "<leader>ds", "<cmd>SqlsSwitchConnection<cr>", desc = "Sqls Switch Connection" },
			},
		},
	},
	config = function()
		-- Configure server opts
		local serverOpts = {}
		serverOpts["bashls"] = { filetypes = { "bash", "sh", "zsh" } }
		serverOpts["biome"] = { filetypes = { "javascript", "typescript", "typescriptreact" } }
		serverOpts["cssls"] = {}
		serverOpts["css_variables"] = {}
		serverOpts["gopls"] = {
			settings = {
				gopls = {
					gofumpt = true,
					hints = {
						enable = true,
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
						functionParameterNames = true,
					},
				},
			},
		}
		serverOpts["html"] = { filetypes = { "html", "templ" } }
		serverOpts["hyprls"] = {}
		serverOpts["jsonls"] = {}
		serverOpts["lua_ls"] = {}
		serverOpts["marksman"] = {}
		serverOpts["sqls"] = {
			on_attach = function(client, bufnr)
				require("sqls").on_attach(client, bufnr)
			end,
		}
		serverOpts["tailwindcss"] = {
			filetypes = { "html", "javascriptreact", "templ", "typescriptreact" },
			init_options = { userLanguages = { templ = "html" } },
		}
		serverOpts["ts_ls"] = {}
		serverOpts["templ"] = {}

		-- Setup each server
		local lspconfig = require("lspconfig")
		for server, config in pairs(serverOpts) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			if server ~= "sqls" then
				config.on_attach = function(client, bufnr)
					require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
				end
			end
			-- This doesnt work for some reason
			-- config.capabilities.workspace = { didChangeWatchedFiles = { dynamicRegistration = true } }
			lspconfig[server].setup(config)
		end

		-- Create LSP keymaps
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(ev)
				local function map(rhs, lhs, desc)
					vim.keymap.set("n", rhs, lhs, { buffer = ev.buf, desc = desc })
				end

				-- Buffer local mappings.
				map("KE", vim.diagnostic.open_float, "Float Error")
				map("KK", vim.lsp.buf.hover, "Hover Docuementation")
				map("grn", vim.lsp.buf.rename, "Rename")
				map("gra", vim.lsp.buf.code_action, "Code Action")
				map("KH", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(nil))
				end, "Toggle Inlay Hints")
			end,
		})
	end,
}
