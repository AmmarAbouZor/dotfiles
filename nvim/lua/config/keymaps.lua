-- Keyvim.keymap.sets are automatically loaded on the VeryLazy event
-- Default keyvim.keymap.sets that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keyvim.keymap.sets here

-- replace without losing clipboard content
vim.keymap.set("x", "<leader>p", '"_dP')

-- redo to shift U
vim.keymap.set({ "n", "v" }, "<S-u>", "<C-r>")

-- emacs keybindings in insert mod
-- backward-char
vim.keymap.set("!", "<C-b>", "<Left>", { silent = true })

-- forward-char
vim.keymap.set("!", "<C-f>", "<Right>", { silent = true })

-- move-beginning-of-line
vim.keymap.set("!", "<C-a>", "<Home>", { silent = true })

-- move-end-of-line
vim.keymap.set("!", "<C-e>", "<End>", { silent = true })

-- backward-word
vim.keymap.set("i", "<M-b>", "<C-Left>", { silent = true })
vim.keymap.set("c", "<M-b>", "<S-Left>", { silent = true })

-- forward-word
vim.keymap.set("i", "<M-f>", "<C-o>e<Right>", { silent = true })
vim.keymap.set("c", "<M-f>", "<S-Right>", { silent = true })
--
-- delete-char
vim.keymap.set("!", "<C-d>", "<Del>", { silent = true })

-- Resize window using <ctrl> <shift> hjkl
vim.keymap.set("n", "<C-S-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-S-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-S-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-S-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Backspace with MiniPairs
local map_bs = function(lhs, rhs)
  vim.keymap.set("i", lhs, rhs, { expr = true, replace_keycodes = false })
end
map_bs("<C-h>", "v:lua.MiniPairs.bs()")
map_bs("<C-w>", 'v:lua.MiniPairs.bs("\23")')
map_bs("<C-u>", 'v:lua.MiniPairs.bs("\21")')

-- remove current buffer
vim.keymap.set("n", "<leader>wq", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete current buffer" })

-- Dismiss Notifications
vim.keymap.set("n", "<leader>d", function()
  require("notify").dismiss({})
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
