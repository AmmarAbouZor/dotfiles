return {
  "hrsh7th/nvim-cmp",
  opts = {
    mapping = require("cmp").mapping.preset.insert({
      ["<Tab>"] = require("cmp").mapping.confirm({ select = true }),
    }),
    sources = require("cmp").config.sources({
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
    }),

    -- completion = {
    --   autocomplete = false,
    -- },
  },
}
