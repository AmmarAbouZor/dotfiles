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

    preselect = cmp.PreselectMode.None,

    sorting = {
      priority_weight = 2,
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        -- cmp.config.compare.scopes,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        -- Same default type but with snippets inverted
        function(entry1, entry2)
          local types = require("cmp.types")
          local kind1 = entry1:get_kind()
          kind1 = kind1 == types.lsp.CompletionItemKind.Text and 100 or kind1
          local kind2 = entry2:get_kind()
          kind2 = kind2 == types.lsp.CompletionItemKind.Text and 100 or kind2
          if kind1 ~= kind2 then
            if kind1 == types.lsp.CompletionItemKind.Snippet then
              return false
            end
            if kind2 == types.lsp.CompletionItemKind.Snippet then
              return true
            end
            local diff = kind1 - kind2
            if diff < 0 then
              return true
            elseif diff > 0 then
              return false
            end
          end
        end,
        -- cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },
  },
}
