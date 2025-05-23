return {
	"brenoprata10/nvim-highlight-colors",
	config = function()
		require("nvim-highlight-colors").setup({
			---@usage 'background'|'foreground'|'virtual'
			render = "virtual",
		})
	end,
}
