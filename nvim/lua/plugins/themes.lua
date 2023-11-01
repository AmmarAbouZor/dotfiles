return {
  { "projekt0n/github-nvim-theme" },
  { "neanias/everforest-nvim" },
  { "ellisonleao/gruvbox.nvim" },
  -- I deactivated this because I didn't find a way to make it lazy
  -- { "sainnhe/gruvbox-material", lazy = false },
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
      -- colorscheme = "gruvbox",
    },
  },
}
