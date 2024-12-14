-- Disable LSP when nvim opened to diff files with `nvim -d`
if vim.opt.diff:get() then
  return {
    "neovim/nvim-lspconfig",
    enabled = false,
  }
end

-- Toggle Show errors only
local show_diagnositcs = false

return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      -- underline = {
      --   severity = vim.diagnostic.severity.ERROR,
      -- },
      virtual_text = false,
    },
    inlay_hints = {
      enabled = false,
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
            -- Disable inactive code info when developing for cross-platform
            diagnostics = {
              disabled = { "inactive-code" },
            },
            cargo = {
              allFeatures = true,
              -- Fix hanging in macros error
              loadOutDirsFromCheck = true,
            },
            procMacro = {
              enable = true,
              -- Taken from LazyVim Rust Extra
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
            -- Rust analyzer search all directories.
            files = {
              excludeDirs = {
                ".direnv",
                ".git",
                ".github",
                ".gitlab",
                "bin",
                "node_modules",
                "target",
                "venv",
                ".venv",
              },
            },
          },
        },
      },
      clangd = {
        mason = false,
      },
      pyright = {
        mason = false,
      },
      solargraph = {
        mason = false,
      },

      -- This code disables the placeholders on functions
      -- vtsls = {
      --   settings = {
      --     typescript = {
      --       suggest = {
      --         completeFunctionCalls = false,
      --       },
      --     },
      --   },
      -- },

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
  init = function()
    -- *** keybindings ***
    local Keys = require("lazyvim.plugins.lsp.keymaps").get()

    vim.list_extend(Keys, {
      { "<leader>a", vim.lsp.buf.code_action, desc = "Code Action" },

      { "<leader>v", vim.diagnostic.open_float, desc = "Line diagnostics" },

      {
        "<leader>ue",
        function()
          show_diagnositcs = not show_diagnositcs
          vim.diagnostic.config({ virtual_text = show_diagnositcs })
        end,
        desc = "Toggle diagnostics text",
      },

      { "<M-p>", false },
      { "<M-n>", false },
    })
  end,
}
