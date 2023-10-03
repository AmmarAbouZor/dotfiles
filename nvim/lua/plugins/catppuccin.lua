if vim.g.neovide then
  return {}
end

return {
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#00000000",
    },
  },

  {
    "catppuccin",
    opts = {
      transparent_background = true,
      integrations = {
        indent_blankline = false,
        -- indent_blankline = {
        --   enabled = true,
        --   scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
        --   colored_indent_levels = false,
        -- },
      },
    },
  },
}
