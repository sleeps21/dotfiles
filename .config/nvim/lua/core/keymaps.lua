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

-- fzf/grep
local fzf = require("fzf-lua")

local function map(m, k, v)
  vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

-- find files
map("n", "<leader>f", fzf.files)
map("n", "<leader>Fc", function()
  fzf.files({ cwd = vim.fn.expand("~/dotfiles/.config/") })
end)

map("n", "<leader>Fo", fzf.oldfiles)

map("n", "<leader>g", fzf.live_grep)
map("n", "<leader>Gc", fzf.grep_cword)
map("n", "<leader>Gq", fzf.lgrep_quickfix)

-- quickfix
map("n", "<leader>q", fzf.quickfix)

-- LSP/diagnostics
map("n", "<leader>l", fzf.lsp_typedefs)
map("n", "<leader>Ld", fzf.lsp_definitions)
map("n", "<leader>LD", fzf.lsp_declarations)
map("n", "<leader>La", fzf.diagnostics_document)
map("n", "<leader>Li", fzf.lsp_implementations)
map("n", "<leader>Lr", fzf.resume)
map("n", "<leader>ca", fzf.lsp_code_actions)
map("n", "<leader>m", fzf.manpages)
map("n", "<leader>km", fzf.keymaps)

-- -- Plugns
-- local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
-- vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
-- vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
-- vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
-- vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
-- vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
-- vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
-- vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
-- vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

-- -- Shortcut for searching your Neovim configuration files
-- vim.keymap.set("n", "<leader>sn", function()
--   builtin.find_files({ cwd = vim.fn.stdpath("config") })
-- end, { desc = "[S]earch [N]eovim files" })

-- keymap.set("n", "<leader>pws", function()
--   local word = vim.fn.expand("<cword>")
--   require("telescope.builtin").grep_string({ search = word })
-- end)
-- keymap.set("n", "<leader>ps", function()
--   require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
-- end)
-- -- LSP
-- local event = "VimEnter"
-- local map = function(keys, func, desc)
--   keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
-- end
-- map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
-- map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
-- map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
-- map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
-- map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
-- map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
-- map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
-- map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
-- map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
