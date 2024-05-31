return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("trouble").setup({ opts = { use_diagnostic_signs = true } })

        vim.keymap.set("n", "<leader>tt", ":TroubleToggle<cr>", { desc = "Toggle Trouble" })
    end,
}
