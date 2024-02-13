return {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  keys = function()
    return {
      { "<leader>gb", "<cmd>G blame<cr>", mode = "n", desc = "Blame file" },
    }
  end,
}
