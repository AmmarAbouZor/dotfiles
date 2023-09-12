return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    if require("lazyvim.util").has("noice.nvim") then
      opts.defaults["<leader>sn"] = { name = "+noice" }
      opts.defaults["<leader>n"] = { name = "+noice" }
    end
    opts.window = {
      border = "single",
    }
  end,
  -- opts = {
  --   window = {
  --     border = "single", -- none, single, double, shadow
  --   },
  -- },
}
