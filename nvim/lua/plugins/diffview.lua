return {
  "sindrets/diffview.nvim",
  lazy = true,

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
        "<leader>gl",
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
