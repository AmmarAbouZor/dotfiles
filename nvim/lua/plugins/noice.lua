return {
  "folke/noice.nvim",

  enabled = false,

  -- stylua: ignore
keys = {
    { "<leader>nl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>nh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>na", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>nd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
  },

  -- dependencies red because I disabled rcarriga/nvim-notify
  -- dependencies = {
  --   "MunifTanjim/nui.nvim",
  -- },

  opts = {
    presets = {
      lsp_doc_border = true, -- add a border to hover docs and signature help
    },

    -- Disable most of noice features and keep lsp progress and signature help
    -- messages = {
    --   view_search = false, -- view for search count messages. Set to `false` to disable
    --   enabled = false, -- enables the Noice messages UI
    -- },
    --
    -- cmdline = {
    --   enabled = false,
    -- },
    --
    -- popupmenu = {
    --   enabled = false, -- enables the Noice popupmenu UI
    -- },
    --
    -- notify = {
    --   enabled = false,
    -- },
    --
    -- lsp = {
    --   message = {
    --     -- Messages shown by lsp servers
    --     enabled = false,
    --   },
    -- },
    --
    -- smart_move = {
    --   enabled = false,
    -- },
  },
}
