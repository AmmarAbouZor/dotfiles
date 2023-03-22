local cmp = require("cmp")
return {
  "hrsh7th/nvim-cmp",
  opts = {
    -- Tab makes problem with the autocompletion in cmd
    mapping = cmp.mapping.preset.insert({
      ["<C-j>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.confirm()
        else
          fallback()
        end
      end, { "i", "s", "c" }),
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
