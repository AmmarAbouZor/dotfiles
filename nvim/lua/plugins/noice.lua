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

  -- stylua: ignore
keys = {
    { "<leader>nl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>nh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>na", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>nd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
  },

  opts = {
    presets = {
      lsp_doc_border = true, -- add a border to hover docs and signature help
    },

    -- messages = {
    --   view_search = false, -- view for search count messages. Set to `false` to disable
    -- },
  },
}
