-- return the theme based on the terminal
-- local function get_theme()
--   local term = vim.fn.getenv("TERM")
--
--   if term == "wezterm" then
--     return "gruvbox-material"
--   else
--     return "catppuccin-mocha"
--   end
-- end

return {
  { "projekt0n/github-nvim-theme" },
  { "neanias/everforest-nvim" },
  { "sainnhe/gruvbox-material" },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "main",
      styles = { transparency = true },
    },
  },
  --
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     transparent = true,
  --   },
  -- },
  {
    "LazyVim/LazyVim",
    lazy = false,
    opts = {
      -- colorscheme = get_theme(),
      -- colorscheme = "catppuccin-mocha",
      colorscheme = "gruvbox-material",
      -- colorscheme = "github_dark_dimmed",
    },
  },
}
