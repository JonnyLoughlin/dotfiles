vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.netrw_liststyle = 3
vim.g.netrw_list_hide = "./*_templ.go"

vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = "a"

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true

vim.o.undofile = true
vim.o.swapfile = false

vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = "yes"

vim.opt.completeopt = { "menuone", "noselect" }

vim.o.termguicolors = true

vim.g.clipboard = {
    name = "OSC 52",
    copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
        ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
        ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
}

-- Install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "plugins" } })

-- [[ Keymaps ]]
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", { desc = "Center cursor after moving down half-page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center cursor after moving up half-page" })

vim.keymap.set("n", "<leader>w", ":w<cr>", { noremap = true, desc = "write buffer" })
vim.keymap.set("n", "<leader>q", ":q<cr>", { noremap = true, desc = "quit" })
vim.keymap.set("n", "<leader>!", ":q!<cr>", { noremap = true, desc = "nvim force quite" })

vim.api.nvim_create_autocmd("BufReadPost", {
    desc = "Open file at the last position it was edited earlier",
    pattern = "*",
    command = 'silent! normal! g`"zv',
})
-- Window Maps
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, desc = "Swap to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, desc = "Swap to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, desc = "Swap to up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, desc = "Swap to right window" })

vim.keymap.set("n", "<C-A-h>", "<C-w><", { noremap = true, desc = "inc window width" })
vim.keymap.set("n", "<C-A-j>", "<C-w>-", { noremap = true, desc = "dec window height" })
vim.keymap.set("n", "<C-A-k>", "<C-w>+", { noremap = true, desc = "inc window height" })
vim.keymap.set("n", "<C-A-l>", "<C-w>>", { noremap = true, desc = "dec window width" })

vim.keymap.set("n", "<leader>n", ":Explore<CR>", { desc = "open netrw" })
