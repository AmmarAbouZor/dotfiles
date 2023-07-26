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
    },
  },
}
