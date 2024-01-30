return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        -- always_show_bufferline = true,
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
      },
    },
  },
}
