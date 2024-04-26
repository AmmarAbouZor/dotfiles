return {
  "echasnovski/mini.move",
  lazy = false,
  opts = {
    mappings = {
      -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
      left = "<M-,>",
      right = "<M-.>",
      down = "<M-j>",
      up = "<M-k>",

      -- Move current line in Normal mode
      line_left = "<M-,>",
      line_right = "<M-.>",
      line_down = "<M-j>",
      line_up = "<M-k>",
    },

    options = {
      -- Automatically reindent selection during linewise vertical move
      reindent_linewise = false,
    },
  },
}
