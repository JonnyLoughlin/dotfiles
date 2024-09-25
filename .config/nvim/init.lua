vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.netrw_liststyle = 3

vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = "a"

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.linebreak = false
vim.o.breakindent = true
vim.o.wrap = true
vim.o.linebreak = true
vim.o.showbreak = "       󱞩"
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

vim.o.undofile = true
vim.o.swapfile = false
vim.o.autoread = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.termguicolors = true

vim.wo.signcolumn = "yes"

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<esc>:nohlsearch<CR>")

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.completeopt = { "menuone", "noselect" }

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.api.nvim_create_autocmd("FileType", {
    pattern = "templ",
    callback = function() vim.bo.commentstring = "// %s" end,
})

-- vim.opt.spell = true
-- vim.opt.spelllang = { "en_us" }

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
require("lazy").setup({ { import = "plugins" } }, { defaults = {} })

-- [[ Keymaps ]]
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function() vim.highlight.on_yank() end,
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

-- go nice error
vim.keymap.set("n", "<leader>Ge", "oif err != nil {}<esc>", { desc = "go insert err check" })
vim.keymap.set("n", "<leader>Gw", 'wbi(<esc>ea)<esc>Bifmt.Errorf<esc>lli"%w", <esc>Ff;<esc>f%', { desc = "go wrap err" })
