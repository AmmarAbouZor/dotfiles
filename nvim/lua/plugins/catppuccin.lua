if vim.g.neovide then
  return {}
end

return {
  {
    "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = false,
      -- transparent background mode sets the background to none
      -- which invoke a warning nvim-notify
      -- custom_highlights = function(_)
      --   return {
      --     NotifyBackground = { bg = "#000000" },
      --   }
      -- end,

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
