-- *** Reset Unused and snippets marking after changing the color scheme ***
-- *** Disable cursor line highlighting on transparent backgrounds ***
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("reset_highlights_on_theme_change", { clear = true }),
  callback = function()
    -- *** Remove Unused variables highlight ***
    vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "NONE" })
    -- *** Remove Snippets highlights ***
    vim.api.nvim_set_hl(0, "SnippetTabstop", { link = "NONE" })

    -- *** Disable cursor line highlighting on transparent backgrounds
    vim.o.cursorline = vim.api.nvim_get_hl(0, { name = "Normal" }).bg ~= nil

    -- Better comments colors
    local themes = { "gruvbox-material", "everforest", "sonokai" }
    local current_scheme = vim.g.colors_name
    if current_scheme and vim.tbl_contains(themes, current_scheme) then
      if vim.o.background == "light" then
        vim.api.nvim_set_hl(0, "Comment", { fg = "#686868" })
      else
        vim.api.nvim_set_hl(0, "Comment", { fg = "#b2a38f" })
      end
    end
  end,
})

-- *** Sonokai Styles ***
local sonokai_styles = { "default", "atlantis", "andromeda", "shusia", "maia", "espresso" }
local current_sonokai_style_index = 1

-- Toggle dark and light colors for themes except `sonokai` because it doesn't have light theme
-- but it have many styles. Therefor we will cycle through them in this case.
local function toggle_background_or_cycle_sonokai()
  -- If the color scheme is sonokai, then cycle between it's styles
  if vim.g.colors_name == "sonokai" then
    current_sonokai_style_index = current_sonokai_style_index % #sonokai_styles + 1
    local next_style = sonokai_styles[current_sonokai_style_index]

    -- Set the Sonokai style
    vim.g.sonokai_style = next_style
    -- Reapply the color theme to let the changes take effect.
    vim.cmd("colorscheme sonokai")

    -- Print a message indicating the new style
    LazyVim.warn("Sonokai style set to: " .. next_style)
  else
    Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):toggle()
  end
end

return {
  { "projekt0n/github-nvim-theme" },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      compile = true,
      transparent = false,
      -- options : "wave", "dragon", "lotus"
      theme = "dragon",
      background = {
        dark = "dragon",
        light = "lotus",
      },
    },
  },
  {
    "sainnhe/everforest",
    init = function()
      vim.api.nvim_set_var("everforest_diagnostic_virtual_text", "colored")
      vim.api.nvim_set_var("everforest_background", "hard")
      -- vim.api.nvim_set_var("everforest_diagnostic_virtual_text", "highlighted")
    end,
  },
  {
    "sainnhe/sonokai",
    keys = {
      { "<leader>ub", toggle_background_or_cycle_sonokai, desc = "Theme Light/Dark & Cycle" },
    },

    init = function()
      vim.api.nvim_set_var("sonokai_style", "default")

      vim.api.nvim_set_var("sonokai_diagnostic_virtual_text", "colored")
      -- vim.api.nvim_set_var("everforest_diagnostic_virtual_text", "highlighted")
    end,
  },
  { "Mofiqul/vscode.nvim" },
  {
    "sainnhe/gruvbox-material",
    -- priority = 1000,
    init = function()
      vim.api.nvim_set_var("gruvbox_material_visual", "green background")
      vim.api.nvim_set_var("gruvbox_material_diagnostic_virtual_text", "colored")
      vim.api.nvim_set_var("gruvbox_material_background", "hard")
      -- vim.api.nvim_set_var("gruvbox_material_diagnostic_virtual_text", "highlighted")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
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

        -- Comments are important
        Comment = { fg = "#b0a082" },
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
      -- colorscheme = "gruvbox-material",
      colorscheme = "gruvbox",
    },
  },
}
