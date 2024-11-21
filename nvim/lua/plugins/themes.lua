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

    local current_scheme = vim.g.colors_name
    if not current_scheme then
      return
    end

    -- Better comments colors
    local themes = { "gruvbox-material", "everforest", "sonokai" }
    if vim.tbl_contains(themes, current_scheme) then
      if vim.o.background == "light" then
        vim.api.nvim_set_hl(0, "Comment", { fg = "#686868" })
      else
        vim.api.nvim_set_hl(0, "Comment", { fg = "#b2a38f" })
      end
    end

    -- Set undercurl manually for base-16 themes
    if current_scheme:sub(1, 3) == "b16" then
      vim.cmd([[
        highlight DiagnosticUnderlineError gui=undercurl
        highlight DiagnosticUnderlineWarn gui=undercurl
        highlight DiagnosticUnderlineInfo gui=undercurl
        highlight DiagnosticUnderlineHint gui=undercurl
        highlight DiagnosticUnderlineOk gui=undercurl
      ]])
    end
  end,
})

--- ************************************** ---
--- *** Toggle between themes variants *** ---
--- ************************************** ---
local sonokai_styles = { "default", "atlantis", "andromeda", "shusia", "maia", "espresso" }
local current_sonokai_style_index = 1

-- This command switch between the variants of the current theme
-- if it provides different variant to switch between them
vim.api.nvim_create_user_command("ThemeVariantSwitch", function()
  local current_scheme = vim.g.colors_name

  if not current_scheme then
    error("Can't get current theme")
  end

  -- Gruvbox material have two variant between background and floating windows.
  if current_scheme == "gruvbox-material" then
    local background = vim.g.gruvbox_material_background
    if not background then
      error("Can't get current background")
    end

    if background == "hard" then
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_float_style = "dim"

      LazyVim.info("gruvbox background set to medium", { title = "Theme Variant" })
    else
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_float_style = "bright"

      LazyVim.info("gruvbox background set to hard", { title = "Theme Variant" })
    end

    -- Reapply the color theme to let the changes take effect.
    vim.cmd("colorscheme gruvbox-material")

  --  Sonokai have multiple styles to switch between them
  elseif current_scheme == "sonokai" then
    current_sonokai_style_index = current_sonokai_style_index % #sonokai_styles + 1
    local next_style = sonokai_styles[current_sonokai_style_index]

    vim.g.sonokai_style = next_style
    -- Reapply the color theme to let the changes take effect.
    vim.cmd("colorscheme sonokai")

    LazyVim.info("Sonokai style set to: " .. next_style, { title = "Theme Variant" })
  else
    LazyVim.warn(current_scheme .. " doesn't support themes variants", { title = "Theme Variant" })
  end
end, {})

--- ***********************************************
--- *** Enabled themes with this configurations ***
--- ***********************************************
return {
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
      vim.g.everforest_diagnostic_virtual_text = "colored"
      vim.g.everforest_background = "hard"
    end,
  },
  {
    "sainnhe/sonokai",
    init = function()
      vim.g.sonokai_style = "default"

      vim.g.sonokai_diagnostic_virtual_text = "colored"
    end,
  },
  { "Mofiqul/vscode.nvim" },
  {
    "sainnhe/gruvbox-material",
    -- priority = 1000,
    init = function()
      vim.g.gruvbox_material_visual = "green background"
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"

      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_float_style = "dim"
      -- vim.g.gruvbox_material_background = "hard"
      -- vim.g.gruvbox_material_float_style = "bright"
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
  { "echasnovski/mini.base16", version = false },
  {
    "LazyVim/LazyVim",
    lazy = false,
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
