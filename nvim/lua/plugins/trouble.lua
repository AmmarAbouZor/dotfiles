return {
  "folke/trouble.nvim",
  opts = {
    multiline = false, -- render multi-line messages
  },
  keys = {
    {
      "<leader>xo",
      "<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<cr>",
      desc = "Diagnostics Errors (Trouble)",
    },
  },
}
