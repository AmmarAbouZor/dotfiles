return {
  {

    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>uc",
        LazyVim.pick("colorscheme", { enable_preview = true, ignore_builtins = true }),
        desc = "Colorscheme with preview",
      },

      { "<leader>uC", false },
      -- I'm using Diffview for that
      -- {
      --   "<leader>gf",
      --   "<cmd>Telescope git_bcommits<cr>",
      --   desc = "Current file history",
      -- },

      { "<leader>bb", "<cmd>Telescope buffers sort_mru=true<cr>", desc = "Buffers" },
      { "<leader>,", "<cmd>Telescope buffers sort_mru=true<cr>", desc = "Buffers" },

      {
        "<leader>s/",
        function()
          require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > "), root = false })
        end,
        mode = "n",
        desc = "Grep word (cwd)",
      },
      {
        "<leader>s.",
        function()
          require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
        end,
        mode = "n",
        desc = "Grep word (Root)",
      },

      {
        "<leader>s?",
        function()
          local whole_word_under_cursor = vim.fn.expand("<cWORD>")
          require("telescope.builtin").grep_string({ search = whole_word_under_cursor })
        end,
        mode = "n",
        desc = "Search WORD",
      },

      { "<leader>sB", LazyVim.pick("live_grep", { grep_open_files = true }), desc = "Word (Open Buffers)" },

      { "<leader>sD", LazyVim.pick("diagnostics", { sort_by = "severity" }), desc = "Workspace Diagnostics" },

      { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    },
    opts = {
      defaults = {
        layout_strategy = "flex",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
          },
          vertical = {
            prompt_position = "top",
            mirror = true,
          },
        },
        extensions = {
          fzf = {},
        },
        mappings = {
          n = {
            ["x"] = function(...)
              return require("telescope.actions").delete_buffer(...)
            end,
          },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local Keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- stylua: ignore
      vim.list_extend(Keys, {
        -- Include current line with references
        { "gr", "<cmd>Telescope lsp_references include_current_line=true<cr>", desc = "References", nowait = true, noremap = true },
      })
    end,
  },
}
