return {
	"mfussenegger/nvim-lint",
	-- dir = "~/proj/nvim-lint",
	ft = { "go", "lua", "javascript", "typescript", "typescriptreact", "sh", "bash" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			go = { "golangcilint" },

			lua = { "luacheck" },

			bash = { "shellcheck" },
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
