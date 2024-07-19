return {
  "danymat/neogen",

  keys = {
    {
      "<leader>cg",
      function()
        require("neogen").generate({})
      end,
      desc = "Generate Documentation",
      { noremap = true, silent = true },
    },
    { "<leader>cn", false },
  },

  opts = {
    placeholders_hl = "None",
  },
}
