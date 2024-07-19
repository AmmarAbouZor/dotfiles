return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.win = {
      border = "single",
    }
    -- Original LazyVim expands this to <C-W> which overwrites my <leader>w shortcut to close the current buffer
    -- This overwrites the changes on LazyVim
    opts.spec = {
      {
        "<leader>w",
        group = "windows",
      },
    }
  end,
}
