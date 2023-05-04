return {
  {
    "L3MON4D3/LuaSnip",
    -- I need that for the supertab
    keys = function()
      return {
        {
          "<tab>",
          function()
            require("luasnip").jump(1)
          end,
          mode = "s",
        },
        {
          "<s-tab>",
          function()
            require("luasnip").jump(-1)
          end,
          mode = { "i", "s" },
        },
      }
    end,
  },
}
