vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Make line numbers default
vim.o.number = true
-- Make numbers relative
vim.o.relativenumber = true
-- Enable mouse mode
vim.o.mouse = "a"
-- Set the number of space characters inserted for indentation when <Tab> is pressed
vim.o.tabstop = 2
-- Control the number of spaces that a <Tab> in the file counts for
vim.o.softtabstop = 2
-- The number of spaces used for each step of (auto)indent
vim.o.shiftwidth = 2
-- If true, spaces are used in response to the Tab key
vim.o.expandtab = true
-- Automatically indents the lines of code
vim.opt.smartindent = true
-- This line enables line wrapping
vim.o.wrap = true
-- This line wraps on whole words instead of splitting them
vim.o.linebreak = true
-- Sync clipboard between OS and Neovim.
vim.o.clipboard = "unnamedplus"
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.o.undofile = true
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"
-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
-- Make sure your terminal supports color
vim.o.termguicolors = true
-- Disable swapfiles
vim.o.swapfile = false

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

require("lazy").setup({
  { import = "plugins" },
})

-- [[ Keymaps ]]
-- Keymaps for better default experience
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
-- Center on move
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor after moving down half-page" })
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
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, desc = "Swap to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, desc = "Swap to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, desc = "Swap to up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, desc = "Swap to right window" })
