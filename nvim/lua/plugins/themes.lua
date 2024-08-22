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
  {
    "catppuccin",
    -- priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = false,
      -- I have the workaround applied in kitty theme and don't need it here.
      kitty = false,

      integrations = {
        cmp = true,
        aerial = true,
        indent_blankline = false,
        fidget = true,
        harpoon = true,
        neotree = true,
        dashboard = true,
        which_key = true,
      },

      custom_highlights = function(C)
        return {
          -- This is for the messages at the bottom of the screen
          MsgSeparator = { bg = C.mantle },

          -- This removes the black background on the popup window that after the cmp popup is shown
          NormalFloat = {
            fg = C.text,
            bg = (require("catppuccin").options.transparent_background and vim.o.winblend == 0) and C.base or C.mantle,
          },
        }
      end,

      -- This will be kept only for the case if I reactivate nvim-notify
      -- transparent background mode sets the background to none
      -- which invoke a warning nvim-notify
      -- custom_highlights = function(_)
      --   return {
      --     NotifyBackground = { bg = "#000000" },
      --   }
      -- end,
    },
  },
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
