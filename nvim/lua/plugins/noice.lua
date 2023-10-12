return {
  "folke/noice.nvim",

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
