return {
  "folke/trouble.nvim",
  opts = {
    multiline = false, -- render multi-line messages
    focus = true, -- Focus the window when opened
    auto_close = true, -- auto close when there are no items

    -- Remove the tree view list
    modes = {
      diagnostics = {
        groups = {
          { "filename", format = "{file_icon} {filename:Title} {count}" },
        },
      },
    },
  },
  keys = {
    {
      "<leader>xo",
      "<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<cr>",
      desc = "Diagnostics Errors (Trouble)",
    },
  },
}
