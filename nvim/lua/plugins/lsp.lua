-- Toggle Show errors only
local show_diagnositcs = false

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
      -- underline = {
      --   severity = vim.diagnostic.severity.ERROR,
      -- },
      virtual_text = false,
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
      pyright = {},
      solargraph = {
        mason = false,
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

    keys[#keys + 1] = { "<leader>a", vim.lsp.buf.code_action, desc = "Code Action" }

    keys[#keys + 1] = {
      "<leader>v",
      vim.diagnostic.open_float,
      desc = "Line diagnostics",
    }

    keys[#keys + 1] = {
      "<leader>ue",
      function()
        show_diagnositcs = not show_diagnositcs
        vim.diagnostic.config({ virtual_text = show_diagnositcs })
      end,
      desc = "Toggle diagnostics text",
    }

    -- This shows the diagnostics in hover window automatically
    -- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    --   group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
    --   callback = function()
    --     vim.diagnostic.open_float(nil, { focus = false })
    --   end,
    -- })

    -- This shows the diagnostics in the current line only
    --   local ns = vim.api.nvim_create_namespace("CurlineDiag")
    --   vim.opt.updatetime = 100
    --   vim.api.nvim_create_autocmd("LspAttach", {
    --     callback = function(args)
    --       vim.api.nvim_create_autocmd("CursorHold", {
    --         buffer = args.buf,
    --         callback = function()
    --           pcall(vim.api.nvim_buf_clear_namespace, args.buf, ns, 0, -1)
    --           local hi = { "Error", "Warn", "Info", "Hint" }
    --           local curline = vim.api.nvim_win_get_cursor(0)[1]
    --           local diagnostics = vim.diagnostic.get(args.buf, { lnum = curline - 1 })
    --           local virt_texts = { { (" "):rep(4) } }
    --           for _, diag in ipairs(diagnostics) do
    --             virt_texts[#virt_texts + 1] = { diag.message, "Diagnostic" .. hi[diag.severity] }
    --           end
    --           vim.api.nvim_buf_set_extmark(args.buf, ns, curline - 1, 0, {
    --             virt_text = virt_texts,
    --             hl_mode = "combine",
    --           })
    --         end,
    --       })
    --     end,
    --   })
  end,
}
