return {
  {
    "akinsho/bufferline.nvim",

    -- stylua: ignore
    keys = {
      { "<leader>k", mode = "n", desc = "GoTo Buffers" },
      { "<leader>kk", function() require("bufferline").go_to(1, true) end, desc = "GoTo First Buffer" },
      { "<leader>k1", function() require("bufferline").go_to(1, true) end, desc = "GoTo First Buffer" },
      { "<leader>k2", function() require("bufferline").go_to(2, true) end, desc = "GoTo Second Buffer" },
      { "<leader>k3", function() require("bufferline").go_to(3, true) end, desc = "GoTo Third Buffer" },
      { "<leader>k4", function() require("bufferline").go_to(4, true) end, desc = "GoTo Fourth Buffer" },
      { "<leader>k5", function() require("bufferline").go_to(5, true) end, desc = "GoTo Fifth Buffer" },
      { "<leader>k0", function() require("bufferline").go_to(-1, true) end, desc = "GoTo Last Buffer" },
    },
  },
}
