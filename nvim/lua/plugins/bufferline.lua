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
      { "<leader>k9", function() require("bufferline").go_to(-1, true) end, desc = "GoTo Last Buffer" },

      { "<leader>1", function() require("bufferline").go_to(1, true) end, desc = "GoTo First Buffer" },
      { "<leader>2", function() require("bufferline").go_to(2, true) end, desc = "GoTo Second Buffer" },
      { "<leader>3", function() require("bufferline").go_to(3, true) end, desc = "GoTo Third Buffer" },
      { "<leader>4", function() require("bufferline").go_to(4, true) end, desc = "GoTo Fourth Buffer" },
      { "<leader>5", function() require("bufferline").go_to(5, true) end, desc = "GoTo Fifth Buffer" },
      { "<leader>6", function() require("bufferline").go_to(6, true) end, desc = "GoTo Fifth Buffer" },
      { "<leader>7", function() require("bufferline").go_to(7, true) end, desc = "GoTo Fifth Buffer" },
      { "<leader>8", function() require("bufferline").go_to(8, true) end, desc = "GoTo Fifth Buffer" },
      { "<leader>9", function() require("bufferline").go_to(-1, true) end, desc = "GoTo Last Buffer" },
    },
    opts = {
      options = {
        custom_filter = function(buf, _)
          -- Ignore file tree buffers
          if vim.bo[buf].filetype == "neo-tree" then
            return false
          end

          -- Directory buffers appears after restoring the session and
          -- they should be ignored.
          local buf_name = vim.api.nvim_buf_get_name(buf)
          local state = vim.uv.fs_stat(buf_name)
          if state and state.type == "directory" then
            return false
          end

          return true
        end,
      },
    },
  },
}
