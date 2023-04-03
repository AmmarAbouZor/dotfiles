-- Neovide disable noice completely
if vim.g.neovide then
  return {}
end

return {
  "folke/noice.nvim",
  -- <C-f> and <C-b> shouldn't be overridden in insert or command mode
  keys = {
    {
      "<c-f>",
      function()
        if not require("noice.lsp").scroll(4) then
          return "<c-f>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll forward",
      mode = "n",
    },
    {
      "<c-b>",
      function()
        if not require("noice.lsp").scroll(-4) then
          return "<c-b>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll backward",
      mode = "n",
    },
  },
}
