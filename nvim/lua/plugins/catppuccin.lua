if vim.g.neovide then
  return {}
end

require("notify").setup({
  background_colour = "#00000000",
})

return {
  {
    "catppuccin",
    opts = {
      transparent_background = true,
    },
  },
}
