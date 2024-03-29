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
      colorscheme = "catppuccin-mocha",
      -- colorscheme = "gruvbox-material",
      -- colorscheme = "github_dark_dimmed",
    },
  },
}
