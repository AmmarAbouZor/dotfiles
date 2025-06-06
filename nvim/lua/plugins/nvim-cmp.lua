-- Not used anymore but kept for reference.
if true then
  return {}
end

local cmp = require("cmp")
-- local luasnip = require("luasnip")

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
  "hrsh7th/nvim-cmp",
  opts = {
    -- Tab makes problem with the autocompletion in cmd
    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.core.view:visible() or vim.fn.pumvisible() == 1 then
          cmp.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          })
        elseif vim.snippet.active({ direction = 1 }) then
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        elseif has_words_before() then
          cmp.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          })
        else
          fallback()
        end
      end, { "i", "s" }),

      -- I couldn't overwrite <C-e> by setting the value to nil and must redefine the function here again
      ["<C-e>"] = cmp.mapping(function(_)
        vim.api.nvim_input("<End>")
      end, { "i", "s" }),

      ["<C-c>"] = cmp.mapping.abort(),

      ["<C-j>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          })
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      ["<C-y>"] = cmp.mapping.confirm({
        select = true,
      }),

      -- Use select instead of insert behavior.
      ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "buffer", keyword_length = 2 },
      { name = "path" },
    }),

    experimental = {
      ghost_text = false,
    },
    window = {
      -- Documentation pop-up highlight identical to completion pop-up with a border
      documentation = {
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu",
        border = "single",
      },
    },

    preselect = cmp.PreselectMode.None,

    sorting = {
      priority_weight = 2,
      comparators = {
        cmp.config.compare.exact,
        cmp.config.compare.sort_text,
        cmp.config.compare.offset,
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
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },
  },
}
