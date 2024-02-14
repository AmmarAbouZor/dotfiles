return {

  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    theme = "catppuccin",
    options = { section_separators = "", component_separators = "" },

    sections = {
      lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        {
          function()
            return " 󰉸 "
          end,
          padding = { left = 0, right = 0 },
          separator = "",
        },
        { "%L", separator = " ", padding = { left = 0, right = 1 } },
      },
    },
  },
}
