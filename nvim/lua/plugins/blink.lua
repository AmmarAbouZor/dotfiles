return {
  "saghen/blink.cmp",
  opts = {
    -- There is not keybinding to toggle signature help yet.
    -- signature = {
    --   enabled = true,
    --   window = {
    --     border = "rounded",
    --   },
    -- },

    sources = {
      providers = {
        lsp = {
          -- Default configurations sets buffer to be a fall back for lsp.
          -- This will activate buffer again and below we set the offset to a lower value
          -- to ensure lsp result will be shown before.
          fallbacks = {},
        },
        buffer = {
          min_keyword_length = 3, -- Minimum number of characters in the keyword to trigger the provider
          -- Keep buffer active but with lower priority so it doesn't mix up with LSP suggestions.
          score_offset = -10,
        },
      },
    },

    completion = {
      ghost_text = {
        enabled = false,
      },
      documentation = {
        window = {
          winblend = 10,
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:BlinkCmpDocCursorLine,Search:None",
          border = "single",
        },
      },
      menu = {
        winblend = 10,
        draw = {
          components = {
            label = {
              width = { max = 45 },
            },
            label_description = {
              highlight = "PmenuExtra",
            },
          },
        },
      },
    },

    keymap = {
      ["<C-y>"] = { "select_and_accept" },
      -- I remapped CR keys in keymaps to resolve conflicts with mini.pairs
      -- ["<C-j>"] = { "accept", "fallback" },
      -- ["<C-m>"] = { "accept", "fallback" },
      -- ["<CR>"] = { "accept", "fallback" },
      -- ["<C-c>"] = { "hide", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },

      ["<C-e>"] = {
        function(cmp)
          return cmp.hide()
        end,
        function(_)
          vim.api.nvim_input("<End>")
          return true
        end,
        "fallback",
      },

      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
    },
  },
}
