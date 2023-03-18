-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    map(mode, lhs, rhs, opts)
  end
end

-- replace without losing clipboard content
map("x", "<leader>p", '"_dP')

-- emacs keybindings in insert mod
-- backward-char
map("!", "<C-b>", "<Left>", { silent = true })

-- forward-char
map("!", "<C-f>", "<Right>", { silent = true })

-- move-beginning-of-line
map("!", "<C-a>", "<Home>", { silent = true })

-- move-end-of-line
map("!", "<C-e>", "<End>", { silent = true })

-- backward-word
map("i", "<M-b>", "<C-Left>", { silent = true })
map("c", "<M-b>", "<S-Left>", { silent = true })

-- forward-word
map("i", "<M-f>", "<C-o>e<Right>", { silent = true })
map("c", "<M-f>", "<S-Right>", { silent = true })
--
-- delete-char
map("!", "<C-d>", "<Del>", { silent = true })
