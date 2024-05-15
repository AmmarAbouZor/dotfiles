-- Keyvim.keymap.sets are automatically loaded on the VeryLazy event
-- Default keyvim.keymap.sets that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keyvim.keymap.sets here

-- Make , a second leader key
vim.cmd("nmap , <space>")

-- replace without losing clipboard content
vim.keymap.set("x", "<leader>p", '"_dP')

-- These are the one to get rid of copying to the system clipboard if I needed
-- vim.keymap.set("n", '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Yank to clipboard' })
-- vim.keymap.set({"v", "x"}, '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Yank to clipboard' })
-- vim.keymap.set({"n", "v", "x"}, '<leader>yy', '"+yy', { noremap = true, silent = true, desc = 'Yank line to clipboard' })
-- vim.keymap.set({"n", "v", "x"}, '<leader>Y', '"+yy', { noremap = true, silent = true, desc = 'Yank line to clipboard' })
-- vim.keymap.set({"n", "v", "x"}, '<C-a>', 'gg0vG$', { noremap = true, silent = true, desc = 'Select all' })
-- vim.keymap.set({'n', 'v', 'x'}, '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from clipboard' })
-- vim.keymap.set('i', '<C-p>', '<C-r>+', { noremap = true, silent = true, desc = 'Paste from clipboard from within insert mode' })
-- vim.keymap.set("x", "<leader>P", '"_dP', { noremap = true, silent = true, desc = 'Paste over selection without erasing unnamed register' })

-- redo to shift U
vim.keymap.set({ "n", "x" }, "<S-u>", "<C-r>")

-- switch to last buffer
vim.keymap.set("n", "<C-q>", "<C-^>")

-- emacs keybindings in insert mod --
-- move-beginning-of-line
vim.keymap.set("!", "<C-a>", "<Home>")

-- move-end-of-line
vim.keymap.set("!", "<C-e>", "<End>", { noremap = true })

-- backward-word
vim.keymap.set("i", "<M-b>", "<C-Left>")
vim.keymap.set("c", "<M-b>", "<S-Left>")

-- forward-word
vim.keymap.set("i", "<M-f>", "<C-Right>")
vim.keymap.set("c", "<M-f>", "<S-Right>")

-- Move buffers in bufferline
vim.keymap.set("n", "<C-S-h>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer to left" })
vim.keymap.set("n", "<C-S-l>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to right" })
vim.keymap.set("n", "<S-Left>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer to left" })
vim.keymap.set("n", "<S-Right>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to right" })

-- Better scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor after moving down half-page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center cursor after moving up half-page" })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Center cursor after moving down page" })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Center cursor after moving up page" })

-- MiniPairs
local map_MiniPairs = function(lhs, rhs)
  vim.keymap.set("i", lhs, rhs, { expr = true, replace_keycodes = false })
end
-- Backspace
map_MiniPairs("<C-h>", "v:lua.MiniPairs.bs()")
map_MiniPairs("<C-w>", 'v:lua.MiniPairs.bs("\23")')
map_MiniPairs("<C-BS>", 'v:lua.MiniPairs.bs("\23")')
map_MiniPairs("<C-u>", 'v:lua.MiniPairs.bs("\21")')
-- Ctrl-j
map_MiniPairs("<C-j>", "v:lua.MiniPairs.cr()")

vim.keymap.set("c", "<C-BS>", "<C-w>")

-- remove current buffer
vim.keymap.set("n", "<leader>wq", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete current buffer" })

local Util = require("lazyvim.util")
-- Gitui
vim.keymap.set("n", "<leader>gu", function()
  Util.terminal.open({ "gitui" }, { cwd = Util.root.get() })
end, { desc = "Gitui (root dir)" })
vim.keymap.set("n", "<leader>gU", function()
  Util.terminal.open({ "gitui" })
end, { desc = "Gitui (cwd)" })

vim.keymap.set("n", "<leader>s'", require("telescope.builtin").resume, { desc = "Resume" })

-- Helix
vim.keymap.set({ "n", "x" }, "gh", "^")
vim.keymap.set({ "n", "x" }, "gl", "$")

-- Mini Move must overwrite lazyvim default bindings
vim.keymap.set("v", "<A-j>", function()
  require("mini.move").move_selection("down")
end)

vim.keymap.set("v", "<A-k>", function()
  require("mini.move").move_selection("up")
end)

vim.keymap.set("n", "<A-j>", function()
  require("mini.move").move_line("down")
end)

vim.keymap.set("n", "<A-k>", function()
  require("mini.move").move_line("up")
end)

-- Apply CSpell
vim.keymap.set("n", "<leader>uq", function()
  vim.notify("Activate CSpell", 2, { title = "option" })
  require("lint").try_lint("cspell")
end, { desc = "Apply CSpell lint" })

-- Reset buffer diagnostic
vim.keymap.set("n", "<leader>ut", function()
  vim.notify("Reset buffer diagnostic", 2, { title = "option" })
  vim.diagnostic.reset(nil, 0)
end, { desc = "Reset Diagnostic" })

-- Show buffer type (For debugging purposes)
-- You can also use the cmd 'echo &ft'
vim.keymap.set("n", "<leader>bt", function()
  print(vim.bo.filetype)
end, { desc = "Show buffer type" })

vim.keymap.set("n", "<leader>gy", LazyVim.lazygit.blame_line, { desc = "Git Blame Line" })

-- NOTE: This function is helpful when I need to use cspell linters with autocmds
--  -- get filetype of current buffer
-- local ft = vim.filetype.match({buf = 0})
--
-- -- empty out the linter table for current filetype
-- require('lint').linters_by_ft[ft] = {}
-- -- add linters to the current buffer
-- require('lint').linters_by_ft[ft] = {"CSpell"}
