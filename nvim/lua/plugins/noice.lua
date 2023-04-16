-- Noice disabled becouse of memry leak
if true then
  return {}
end

-- Neovide disable noice completely
if vim.g.neovide then
  return {}
end

return {
  "folke/noice.nvim",
  -- <C-f> and <C-b> shouldn't be overridden in insert or command mode
  -- Update: I'll try not to use emaces <C-f> <C-b> anymore
  -- keys = {
  --   {
  --     "<c-f>",
  --     function()
  --       if not require("noice.lsp").scroll(4) then
  --         return "<c-f>"
  --       end
  --     end,
  --     silent = true,
  --     expr = true,
  --     desc = "Scroll forward",
  --     mode = "n",
  --   },
  --   {
  --     "<c-b>",
  --     function()
  --       if not require("noice.lsp").scroll(-4) then
  --         return "<c-b>"
  --       end
  --     end,
  --     silent = true,
  --     expr = true,
  --     desc = "Scroll backward",
  --     mode = "n",
  --   },
  -- },

  opts = {
    presets = {
      lsp_doc_border = true, -- add a border to hover docs and signature help
    },
  },
}
