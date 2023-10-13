-- Keyvim.keymap.sets are automatically loaded on the VeryLazy event
-- Default keyvim.keymap.sets that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keyvim.keymap.sets here

-- replace without losing clipboard content
vim.keymap.set("x", "<leader>p", '"_dp')
vim.keymap.set("x", "<leader>P", '"_dP')

-- redo to shift U
vim.keymap.set({ "n", "x" }, "<S-u>", "<C-r>")

-- emacs keybindings in insert mod
-- backward-char
-- vim.keymap.set("c", "<C-b>", "<Left>")

-- forward-char
-- vim.keymap.set("c", "<C-f>", "<Right>")

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
--
-- delete-char
-- vim.keymap.set("!", "<C-d>", "<Del>")

-- Move buffers in bufferline
vim.keymap.set("n", "<C-S-h>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer to left" })
vim.keymap.set("n", "<C-S-l>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to right" })
vim.keymap.set("n", "<S-Left>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer to left" })
vim.keymap.set("n", "<S-Right>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to right" })

-- Backspace with MiniPairs
local map_bs = function(lhs, rhs)
  vim.keymap.set("i", lhs, rhs, { expr = true, replace_keycodes = false })
end
map_bs("<C-h>", "v:lua.MiniPairs.bs()")
map_bs("<C-w>", 'v:lua.MiniPairs.bs("\23")')
map_bs("<C-Bs>", 'v:lua.MiniPairs.bs("\23")')
map_bs("<C-u>", 'v:lua.MiniPairs.bs("\21")')
vim.keymap.set("c", "<C-Bs>", "<C-w>")

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

-- aerial
vim.keymap.set("n", "<leader>r", function()
  require("aerial").toggle()
end)
-- I have the same bindings in Visual Studio
vim.keymap.set("n", "<M-p>", function()
  require("aerial").prev()
end)
vim.keymap.set("n", "<M-n>", function()
  require("aerial").next()
end)

-- Toggle spell
local spell_enabled = false
vim.keymap.set("n", "<leader>uq", function()
  spell_enabled = not spell_enabled
  if spell_enabled then
    vim.notify("Activate CSpell", 2, { title = "option" })
    require("lint").try_lint("cspell")
  else
    vim.notify("Reset buffer diagnostic", 2, { title = "option" })
    vim.diagnostic.reset(nil, 0)
  end
end, { desc = "Toggle CSpell" })
