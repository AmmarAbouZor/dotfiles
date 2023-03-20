local cmp = require("cmp")
return {
  "hrsh7th/nvim-cmp",
  opts = {
    mapping = cmp.mapping.preset.insert({
      -- ["<Tab>"] = cmp.mapping(function(fallback)
      --   if cmp.visible() then
      --     cmp.confirm()
      --   else
      --     fallback()
      --   end
      -- end, { "i", "s", "c" }),
    }),

    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
    }),

    -- completion = {
    --   autocomplete = false,
    -- },
  },
}
