-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- This fixes the problem with
-- im.api.nvim_create_autocmd({ "BufEnter" }, {
--  pattern = { "*" },
--  command = "normal zx zR",
-- )
