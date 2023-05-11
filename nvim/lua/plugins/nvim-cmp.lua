local cmp = require("cmp")
local luasnip = require("luasnip")

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
      end, { "i", "s" }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.confirm()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),

      -- switch <Ctrl-c> and <Ctrl-e>
      -- ["<C-c>"] = cmp.mapping.abort(),
      -- ["<C-e>"] = cmp.mapping(function(fallback)
      --   fallback()
      -- end),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "buffer", keyword_length = 2 },
      { name = "path" },
    }),

    experimental = {
      ghost_text = false,
    },

    sorting = {
      comparators = {
        cmp.config.compare.recently_used,
        cmp.config.compare.score,
        cmp.config.compare.offset,
        cmp.config.compare.order,
        -- type
        function(entry1, entry2)
          local kind1 = entry1:get_kind()
          local kind2 = entry2:get_kind()
          if kind1 ~= kind2 then
            local diff = kind1 - kind2
            if diff < 0 then
              return true
            elseif diff > 0 then
              return false
            end
          end
        end,
      },
    },
  },
}
