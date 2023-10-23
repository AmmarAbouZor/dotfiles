return {
  "tpope/vim-fugitive",
  lazy = true,
  keys = function()
    return {
      { "<leader>gb", "<cmd>G blame<cr>", mode = "n", desc = "Blame file" },
    }
  end,
}
