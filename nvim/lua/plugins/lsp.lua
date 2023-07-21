return {
  "neovim/nvim-lspconfig",
  -- dependencies = {
  --   "j-hui/fidget.nvim",
  --   tag = "legacy",
  --   opts = {
  --     text = {
  --       spinner = "dots",
  --       -- spinner = "grow_vertical",
  --       -- spinner = "clock",
  --       -- spinner = "moon",
  --     },
  --     window = {
  --       blend = 0, -- &winblend for the window
  --     },
  --     fmt = {
  --       -- function to format each task line
  --       task = function(_)
  --         return nil
  --       end,
  --     },
  --   },
  -- },
  opts = {
    diagnostics = {
      underline = {
        severity = vim.diagnostic.severity.ERROR,
      },
    },
    servers = {
      rust_analyzer = {
        mason = false,
        cmd = {
          "rustup",
          "run",
          "stable",
          "rust-analyzer",
        },
        settings = {
          ["rust-analyzer"] = {
            completion = {
              callable = {
                snippets = "add_parentheses",
              },
            },
          },
        },
      },
      -- I'm not using golang at the momment
      -- gopls = {
      --   settings = {
      --     gopls = {
      --       analyses = {
      --         unusedparams = true,
      --       },
      --     },
      --   },
      -- },
    },
  },
  -- keybindings
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    keys[#keys + 1] = { "<leader>k", vim.lsp.buf.hover, desc = "Hover" }
    keys[#keys + 1] = { "<leader>a", vim.lsp.buf.code_action, desc = "Code Action" }
  end,
}
