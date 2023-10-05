-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- {{{ Fold setting
-- old setting
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldenable = false
--
-- this should work on newer version of neovim
-- for now I'll still use nvim-ufo
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
--
--
--
-- This works somehow good with the indentation only. It would works very good when neovim 10 is released and with the default options from LazyVim
-- vim.opt.foldlevel = 99
-- vim.opt.foldtext = "v:lua.require'lazyvim.util.ui'.foldtext()"
-- vim.opt.foldmethod = "indent"
--
-- {{{

opt.hlsearch = false
opt.incsearch = true

opt.shell = "fish"

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
