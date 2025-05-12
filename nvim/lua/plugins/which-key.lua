return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    -- Original LazyVim expands this to <C-W> which overwrites my <leader>w shortcut to close the current buffer
    -- This overwrites the changes on LazyVim
    vim.list_extend(opts.spec, {
      { "<leader>w", group = false },
      { "<leader>k", group = "GoTo Buffers" },
      { "<leader>.", group = "Nvim Development" },
    })
  end,
}
