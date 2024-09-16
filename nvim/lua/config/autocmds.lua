-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- This fixes the problem with
-- im.api.nvim_create_autocmd({ "BufEnter" }, {
--  pattern = { "*" },
--  command = "normal zx zR",
-- )

-- close fugitive buffers with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("Close_fugitive_q", { clear = true }),
  pattern = {
    "fugitive",
    "fugitiveblame",
    "fugitivediff",
    -- TODO: This could do some problems since I still don't know which other git buffers are
    "git",
    "oil",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Close with q if nvim opened as diff tool with `nvim -d ...`
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.opt.diff:get() then
      vim.api.nvim_set_keymap("n", "q", ":qa<CR>", { noremap = true, silent = true })
    end
  end,
})

-- Spell is enabled by default not globally.
-- -- Enable spell check on text files by default
-- vim.api.nvim_create_autocmd("FileType", {
--   group = vim.api.nvim_create_augroup("text_spell", { clear = true }),
--   pattern = {
--     "text",
--   },
--   callback = function()
--     vim.opt_local.spell = true
--   end,
-- })

-- Remove highlight on yank from LazyVim
vim.api.nvim_clear_autocmds({ group = "lazyvim_highlight_yank" })

-- Reset Unused and snippets marking after changing the color scheme
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("reset_highlights_on_theme_change", { clear = true }),
  callback = function()
    -- *** Remove Unused variables highlight ***
    vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "NONE" })
    -- *** Remove Snippets highlights ***
    vim.api.nvim_set_hl(0, "SnippetTabstop", { link = "NONE" })
  end,
})

-- Reset Unused and snippets marking on LSP Attache
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("reset_highlights_on_lsp_change", { clear = true }),
  callback = function(ev)
    -- *** Remove Unused variables highlight ***
    vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "NONE" })

    -- *** Remove Snippets highlights ***
    vim.api.nvim_set_hl(0, "SnippetTabstop", { link = "NONE" })
  end,
})

-- Fix conceallevel for md files
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("markdown_conceal", { clear = true }),
  pattern = {
    "markdown",
  },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})
