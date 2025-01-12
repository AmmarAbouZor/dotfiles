return {
  "sindrets/diffview.nvim",
  lazy = true,

  -- Close diff view with q in all diffviews buffers
  opts = {
    keymaps = {
      view = { { "n", "q", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" } },
      diff1 = { { "n", "q", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" } },
      diff2 = { { "n", "q", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" } },
      diff3 = { { "n", "q", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" } },
      diff4 = { { "n", "q", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" } },
      file_panel = { { "n", "q", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" } },
      file_history_panel = { { "n", "q", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" } },
      option_panel = { { "n", "q", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" } },
      help_panel = { { "n", "q", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" } },
    },
  },

  keys = function()
    return {
      {
        "<leader>gd",
        "<cmd>DiffviewOpen<cr>",
        mode = "n",
        desc = "Diffview Open",
      },
      {
        "<leader>gq",
        "<cmd>DiffviewClose<cr>",
        mode = "n",
        desc = "Diffview Close",
      },
      {
        "<leader>gr",
        "<cmd>DiffviewRefresh<cr>",
        mode = "n",
        desc = "Diffview Refresh",
      },
      {
        "<leader>gL",
        "<cmd>DiffviewFileHistory<cr>",
        mode = "n",
        desc = "DiffView Git Log",
      },
      {
        "<leader>gf",
        "<cmd>DiffviewFileHistory %<cr>",
        mode = "n",
        desc = "File history",
      },
      {
        "<leader>go",
        function()
          local word_under_cursor = vim.fn.expand("<cword>")
          require("diffview").open({ word_under_cursor .. "^!" })
        end,
        mode = "n",
        desc = "Diffview Open Rev",
      },
    }
  end,
}
