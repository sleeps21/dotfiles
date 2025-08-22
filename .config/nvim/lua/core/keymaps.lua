-- Set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap

-- reload config
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- executes current files
vim.keymap.set("n", "<leader><leader>x", ":w<CR>:source %<CR>")

-- General
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = false })
