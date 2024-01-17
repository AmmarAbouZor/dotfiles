-- Keyvim.keymap.sets are automatically loaded on the VeryLazy event
-- Default keyvim.keymap.sets that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keyvim.keymap.sets here

-- replace without losing clipboard content
vim.keymap.set("x", "<leader>p", '"_dP')

-- redo to shift U
vim.keymap.set({ "n", "x" }, "<S-u>", "<C-r>")

-- emacs keybindings in insert mod --
-- move-beginning-of-line
vim.keymap.set("!", "<C-a>", "<Home>")

-- move-end-of-line
vim.keymap.set("!", "<C-e>", "<End>")

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

-- Dismiss Notifications
vim.keymap.set("n", "<leader>d", function()
  require("notify").dismiss({ pending = true, silent = true })
end, { desc = "Dismiss notifies" })

-- Toggle Show errors only
local show_errors_only = false
vim.keymap.set("n", "<leader>ue", function()
  show_errors_only = not show_errors_only
  if show_errors_only then
    vim.diagnostic.config({ virtual_text = {
      severity = vim.diagnostic.severity.ERROR,
    } })
  else
    vim.diagnostic.config({ virtual_text = true })
  end
end, { desc = "Toggle show errors only" })

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
vim.keymap.set("n", "<leader>bt", function()
  print(vim.bo.filetype)
end, { desc = "Show buffer type" })

-- NOTE: This function is helpful when I need to use cspell linters with autocmds
--  -- get filetype of current buffer
-- local ft = vim.filetype.match({buf = 0})
--
-- -- empty out the linter table for current filetype
-- require('lint').linters_by_ft[ft] = {}
-- -- add linters to the current buffer
-- require('lint').linters_by_ft[ft] = {"CSpell"}
