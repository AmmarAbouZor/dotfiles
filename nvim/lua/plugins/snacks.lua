return {
  "folke/snacks.nvim",
  opts = {
    notifier = { enabled = false },
    terminal = {
      win = {
        -- Disable default navigations with <C-..>
        keys = {
          nav_h = false,
          nav_j = false,
          nav_k = false,
          nav_l = false,
        },
        -- Terminal is bordered and centered by default
        position = "float",
        border = "rounded",
      },
    },
  },
}
