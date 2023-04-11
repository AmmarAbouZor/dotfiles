-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- I use nvim ufo for folding
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldenable = false

opt.hlsearch = false
opt.incsearch = true

opt.shell = "fish"

opt.undofile = false
opt.timeoutlen = 600

opt.winbar = "%=%m %f"
