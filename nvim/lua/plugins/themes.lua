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
  { "sainnhe/everforest" },
  { "sainnhe/sonokai" },
  { "Mofiqul/vscode.nvim" },
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    init = function()
      -- vim.api.nvim_set_var("gruvbox_material_float_style", "dim")
      -- vim.api.nvim_set_var("gruvbox_material_visual", "red background")
      -- vim.api.nvim_set_var("gruvbox_material_visual", "blue background")
      vim.api.nvim_set_var("gruvbox_material_visual", "green background")
      -- vim.api.nvim_set_var("gruvbox_material_diagnostic_virtual_text", "colored")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      bold = false,
      -- Enable Transparent expect in neovide.
      transparent_mode = not vim.g.neovide,
      -- Override the bold gold highlighting for word under cursor and its matches.
      overrides = {
        -- This is lighter option on highlighting. With that we can recognize the highlighting on cursor line
        LspReferenceRead = { link = "CursorLine" },
        LspReferenceText = { link = "CursorLine" },
        LspReferenceWrite = { link = "CursorLine" },
        --
        -- This is heavier one, but we can recognize the highlighting under the cursor.
        -- LspReferenceRead = { link = "PmenuSbar" },
        -- LspReferenceText = { link = "PmenuSbar" },
        -- LspReferenceWrite = { link = "PmenuSbar" },
      },
    },
  },
  {
    "rose-pine/neovim",
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
