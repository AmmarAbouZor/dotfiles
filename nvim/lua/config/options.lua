-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.hlsearch = false
opt.incsearch = true

opt.shell = "fish"

-- TODO: Check if this is usefull
opt.jumpoptions = "stack"

opt.undofile = false
opt.timeoutlen = 600

opt.winbar = "%=%m %f"

local border = "rounded"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = border,
})

vim.diagnostic.config({
  float = { border = border },
})

-- This prvent add offset when scrolling so the cursor doesn't get to the top or the buttom of the view
opt.scrolloff = 7

-- Ignore case in auto complete for vim commands
opt.ignorecase = true

-- Show spilt window while seaching and replaceing
opt.inccommand = "split"

-- Remove - for whitespaces and > for tabs
opt.list = false
-- opt.list = true
-- -- opt.listchars = { eol = "⏎" }
-- opt.listchars = { eol = "↲" }

opt.showmode = true

opt.showcmd = false

-- Enable line wrap on words
vim.o.linebreak = true
