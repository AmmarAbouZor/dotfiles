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
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
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

-- close deleted files via oil.nvim
vim.api.nvim_create_autocmd("User", {
  pattern = "OilActionsPost",
  callback = function(args)
    local parse_url = function(url)
      return url:match("^.*://(.*)$")
    end

    if args.data.err then
      return
    end

    for _, action in ipairs(args.data.actions) do
      if action.type == "delete" and action.entry_type == "file" then
        local path = parse_url(action.url)
        local bufnr = vim.fn.bufnr(path)
        if bufnr == -1 then
          return
        end

        -- When removed buffer is the active one then we need to call removing
        -- from win_execute, otherwise we can just call it directly.
        local winnr = vim.fn.win_findbuf(bufnr)[1]
        if winnr then
          vim.fn.win_execute(winnr, "bfirst | bw " .. bufnr)
        else
          vim.cmd("bw" .. bufnr)
        end
      end
    end
  end,
})
