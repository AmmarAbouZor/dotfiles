-- *** Reset Unused and snippets marking after changing the color scheme ***
-- *** Disable cursor line highlighting on transparent backgrounds ***
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("reset_highlights_on_theme_change", { clear = true }),
  callback = function()
    -- *** Sets theme environment variable to share it with the built-in terminal.
    if vim.o.background == "light" then
      vim.env.NVIM_THEME = "light"
    else
      vim.env.NVIM_THEME = "dark"
    end

    -- *** Remove Unused variables special highlight ***
    vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "TEXT" })
    -- *** Remove Snippets special highlight ***
    vim.api.nvim_set_hl(0, "SnippetTabstop", { link = "TEXT" })

    -- *** Blink description text color ***
    vim.cmd("hi! link BlinkCmpLabelDetail PmenuExtra")
    vim.cmd("hi! link BlinkCmpDocSeparator PmenuExtra")

    -- *** Link Picker directory highlighting to comments ***
    vim.cmd("hi! link SnacksPickerDir Comment")

    -- *** Disable cursor line background highlighting on transparent backgrounds
    local transparent = vim.api.nvim_get_hl(0, { name = "Normal" }).bg == nil
    if transparent then
      vim.cmd([[
          highlight CursorLine guibg=none
          highlight CursorLineNr guibg=none
          hi! link NeoTreeCursorLine ColorColumn
        ]])
    end

    local current_scheme = vim.g.colors_name
    if not current_scheme then
      return
    end

    -- Better comments colors & set floating windows to transparent
    local themes = { "gruvbox-material", "everforest", "sonokai" }
    if vim.tbl_contains(themes, current_scheme) then
      if transparent then
        -- Floating windows to transparent
        vim.cmd([[
          highlight NormalFloat guibg=none
          highlight FloatBorder guibg=none guifg=reset
          highlight FloatTitle guibg=none
          highlight FloatFooter guibg=none
        ]])
      end
      -- Make window bar transparent
      vim.cmd([[
          highlight WinBar guibg=none
          highlight WinBarNC guibg=none
        ]])

      if vim.o.background == "light" then
        vim.cmd("highlight Comment guifg='#606853'")
      else
        vim.cmd("highlight Comment guifg='#b2a38f'")
      end

      if current_scheme == "sonokai" then
        vim.cmd.highlight("WinSeparator guifg=gray")
      end
    end

    -- Comments & Picker on original gruvbox
    if current_scheme == "gruvbox" then
      if vim.o.background == "light" then
        vim.cmd("highlight Comment guifg='#606853'")
      else
        vim.cmd("highlight Comment guifg='#b0a082'")

        -- Snacks picker default to cursor line which is disabled in transparent mode.
        if transparent then
          vim.cmd("highlight SnacksPickerCursorLine guibg='#3C3836'")
          vim.cmd("highlight SnacksPickerListCursorLine guibg='#3C3836'")
        end
      end
    end

    -- Comments on kanagawa-paper
    if current_scheme == "kanagawa-paper" then
      if vim.o.background == "dark" then
        vim.cmd("highlight Comment guifg='#b2a38f'")
      else
      end
    end

    -- Set under-curl for default themes
    if current_scheme == "default" then
      vim.cmd([[
        highlight DiagnosticUnderlineError gui=undercurl
        highlight DiagnosticUnderlineWarn gui=undercurl
        highlight DiagnosticUnderlineInfo gui=undercurl
        highlight DiagnosticUnderlineHint gui=undercurl
        highlight DiagnosticUnderlineOk gui=undercurl
      ]])
    end

    -- Set under-curl for randomhue themes
    if current_scheme == "randomhue" then
      vim.cmd([[
        highlight DiagnosticUnderlineError gui=undercurl
        highlight DiagnosticUnderlineWarn gui=undercurl
        highlight DiagnosticUnderlineInfo gui=undercurl
        highlight DiagnosticUnderlineHint gui=undercurl
        highlight DiagnosticUnderlineOk gui=undercurl

        highlight WinBar guibg=none gui=bold
        highlight WinBarNC guibg=none
      ]])
    end

    -- Tweaks for base-16 themes
    if current_scheme:sub(1, 3) == "b16" then
      vim.cmd([[
        highlight DiagnosticUnderlineError gui=undercurl
        highlight DiagnosticUnderlineWarn gui=undercurl
        highlight DiagnosticUnderlineInfo gui=undercurl
        highlight DiagnosticUnderlineHint gui=undercurl
        highlight DiagnosticUnderlineOk gui=undercurl

        highlight WinSeparator guibg=none guifg=reset

        highlight LineNrBelow guibg=none
        highlight LineNrAbove guibg=none
        highlight CursorLineNr guibg=none
        highlight LineNr guibg=none
        highlight CursorLineFold guibg=none

        highlight WinBar guibg=none
        highlight WinBarNC guibg=none

        highlight GitSignsAdd guibg=none
        highlight GitSignsChange guibg=none
        highlight GitSignsDelete guibg=none

        highlight DiagnosticFloatingError guibg=none
        highlight DiagnosticFloatingWarn guibg=none
        highlight DiagnosticFloatingInfo guibg=none
        highlight DiagnosticFloatingHint guibg=none
        highlight DiagnosticFloatingOk guibg=none
      ]])

      -- Floating window's title background should match its borders
      local normal_bg = vim.api.nvim_get_hl(0, { name = "NormalFloat" }).bg
      if normal_bg then
        vim.cmd("highlight FloatTitle guibg='" .. string.format("#%06x", normal_bg) .. "'")
      end
    end
  end,
})

--- ************************************** ---
--- *** Toggle between themes variants *** ---
--- ************************************** ---
-- This command switch between the variants of the current theme
-- if it provides different variant to switch between them
vim.api.nvim_create_user_command("ThemeVariantSwitch", function()
  local current_scheme = vim.g.colors_name

  if not current_scheme then
    error("Can't get current theme")
  end

  -- Gruvbox material have two variant between background and floating windows.
  if current_scheme == "gruvbox-material" then
    local transparent = vim.g.gruvbox_material_transparent_background
    local background = vim.g.gruvbox_material_background

    if not background and not transparent then
      error("Can't get either current background nor transparent")
    end

    if transparent and transparent > 0 then
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_background = "hard"

      LazyVim.info("gruvbox background set to hard", { title = "Theme Variant" })
    elseif background == "hard" then
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_background = "medium"

      LazyVim.info("gruvbox background set to medium", { title = "Theme Variant" })
    else
      vim.g.gruvbox_material_transparent_background = 1

      LazyVim.info("gruvbox background set to transparent", { title = "Theme Variant" })
    end

    -- Reapply the color theme to let the changes take effect.
    vim.cmd("colorscheme gruvbox-material")
  elseif current_scheme == "everforest" then
    local transparent = vim.g.everforest_transparent_background
    if transparent and transparent > 0 then
      vim.g.everforest_transparent_background = 0
      LazyVim.info("everforest background set to hard", { title = "Theme Variant" })
    else
      vim.g.everforest_transparent_background = 2
      LazyVim.info("everforest background set to transparent", { title = "Theme Variant" })
    end

    vim.cmd("colorscheme everforest")

  --  Sonokai have multiple styles to switch between them
  elseif current_scheme == "sonokai" then
    local transparent = vim.g.sonokai_transparent_background

    if transparent and transparent > 0 then
      vim.g.sonokai_transparent_background = 0
      LazyVim.info("sonokai background set to solid", { title = "Theme Variant" })
    else
      vim.g.sonokai_transparent_background = 2
      LazyVim.info("sonokai background set to transparent", { title = "Theme Variant" })
    end

    -- Reapply the color theme to let the changes take effect.
    vim.cmd("colorscheme sonokai")
  elseif current_scheme == "randomhue" then
    -- This will apply other color accent
    vim.cmd("colorscheme randomhue")
  elseif current_scheme == "gruvbox" then
    local gruvbox = require("gruvbox")

    if gruvbox.config.transparent_mode then
      gruvbox.config.transparent_mode = false
      gruvbox.config.contrast = "hard"
      LazyVim.info("Gruvbox backgound set to hard")
    elseif gruvbox.config.contrast == "hard" then
      gruvbox.config.contrast = ""
      LazyVim.info("Gruvbox backgound set to medium")
    else
      gruvbox.config.transparent_mode = true
      LazyVim.info("Gruvbox backgound set to transparent")
    end
    -- Apply changes.
    gruvbox.load()
    vim.cmd("colorscheme gruvbox")
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
      vim.g.everforest_current_word = "grey background"
      vim.g.everforest_transparent_background = 2
      vim.g.everforest_float_style = "dim"
    end,
  },
  {
    "sainnhe/sonokai",
    init = function()
      vim.g.sonokai_style = "default"
      vim.g.sonokai_current_word = "grey background"
      vim.g.sonokai_transparent_background = 2

      vim.g.sonokai_diagnostic_virtual_text = "colored"
    end,
  },
  { "Mofiqul/vscode.nvim" },
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    init = function()
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_current_word = "grey background"

      -- vim.g.gruvbox_material_visual = "grey background"
      -- vim.g.gruvbox_material_visual = "green background"

      -- vim.g.gruvbox_material_background = "medium"
      -- vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_transparent_background = 1
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    -- priority = 1000,
    opts = {
      bold = false,
      -- Enable Transparent expect in neovide.
      transparent_mode = not vim.g.neovide,
      -- Override the bold gold highlighting for word under cursor and its matches.
      overrides = {
        LspReferenceRead = { link = "PmenuSbar" },
        LspReferenceText = { link = "PmenuSbar" },
        LspReferenceWrite = { link = "PmenuSbar" },

        WinBar = { bg = "", fg = "fg", bold = true },
        WinBarNC = { bg = "", fg = "#a89984" },
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

      custom_highlights = function(C)
        return {
          -- This is for the messages at the bottom of the screen
          MsgSeparator = { bg = C.mantle },
          WinSeparator = { fg = C.surface2 },

          FloatBorder = { bg = C.mantle },
          FloatTitle = { bg = C.mantle },
          FloatFooter = { bg = C.mantle },
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
  { "armannikoyan/rusty" },
  {
    "thesimonho/kanagawa-paper.nvim",
    opts = {
      cache = true,
      diag_background = false,
    },
  },
  {
    "LazyVim/LazyVim",
    lazy = false,
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
