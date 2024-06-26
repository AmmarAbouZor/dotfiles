local Util = require("lazyvim.util")

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>uC",
      function()
        -- Load all themes
        require("tokyonight")
        require("github-theme")
        require("lazy").load({ plugins = { "gruvbox-material", "catppuccin", "everforest", "sonokai" } })
        require("rose-pine")
        require("gruvbox")

        -- Then Open telescope themes picker
        Util.telescope("colorscheme", { enable_preview = true })()
      end,
      desc = "Colorscheme with preview",
    },
    -- I'm using Diffview for that
    -- {
    --   "<leader>gf",
    --   "<cmd>Telescope git_bcommits<cr>",
    --   desc = "Current file history",
    -- },

    { "<leader>bb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },

    -- { "<leader>,", Util.telescope("files"), desc = "Find Files (root dir)" },

    {
      "<leader>s/",
      function()
        require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
      end,
      mode = "n",
      desc = "Grep word",
    },

    -- TODO AAZ: Activate after update to neovim 0.10
    -- { "<leader>sB", LazyVim.pick("live_grep", { grep_open_files = true }), desc = "Word (Open Buffers)" },
    -- { "<leader>sD", LazyVim.pick("diagnostics", { sort_by = "severity" }), desc = "Workspace Diagnostics" },

    {
      "<leader>s?",
      function()
        local whole_word_under_cursor = vim.fn.expand("<cWORD>")
        require("telescope.builtin").grep_string({ search = whole_word_under_cursor })
      end,
      mode = "n",
      desc = "Search WORD",
    },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
        },
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
}
