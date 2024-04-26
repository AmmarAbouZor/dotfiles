return {
  "danymat/neogen",
  config = true,

  keys = {
    {
      "<leader>cg",
      function()
        require("neogen").generate({})
      end,
      desc = "Generate Documentation",
      { noremap = true, silent = true },
    },
  },
  opts = {
    snippet_engine = "luasnip",
    -- placeholders_hl = "None",
  },
}
