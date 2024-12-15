-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_picker = "telescope"

local opt = vim.opt

opt.hlsearch = false
opt.incsearch = true

opt.shell = "fish"

-- TODO: Check if this is useful
opt.jumpoptions = "stack"

opt.undofile = false
opt.timeoutlen = 600

-- Remember to activate the autocmd for text files if you decide to activate spell by default.
opt.spell = true

-- Enable spell check on plain buffers only if they are given as CLI arguments
if vim.fn.argc(-1) == 0 then
  opt.spelloptions:append("noplainbuffer")
else
  --- index for argv is provided => only one item will be returned
  ---@diagnostic disable-next-line: param-type-mismatch
  local stats = vim.uv.fs_stat(vim.fn.argv(0))
  if stats and stats.type == "directory" then
    opt.spelloptions:append("noplainbuffer")
  end
end

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

-- This prevent add offset when scrolling so the cursor doesn't get to the top or the bottom of the view
opt.scrolloff = 7

-- Ignore case in auto complete for vim commands
opt.ignorecase = true

-- Show spilt window while searching and replacing
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
