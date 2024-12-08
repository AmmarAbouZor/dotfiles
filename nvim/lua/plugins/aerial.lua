return {
  "stevearc/aerial.nvim",
  -- Plugin is handled automatically since it's an extra on LazyVim
  -- lazy = true,
  -- -- Optional dependencies
  -- dependencies = {
  --   "nvim-treesitter/nvim-treesitter",
  --   "nvim-tree/nvim-web-devicons",
  -- },
  opts = {
    backends = { "treesitter", "lsp", "markdown", "man" },
    layout = {
      default_direction = "prefer_left",
      min_width = 30,
    },

    -- Move 5 lines up from the middle.
    -- post_jump_cmd = "normal! 5j zz",
    -- This is the original one
    -- post_jump_cmd = "normal! zz",
    post_jump_cmd = false,

    keymaps = {
      ["<C-n>"] = "actions.down_and_scroll",
      ["<C-p>"] = "actions.up_and_scroll",
    },

    close_on_select = true,
  },
  keys = {
    { "<leader>r", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
    { "<M-p>", "<cmd>AerialPrev<cr>", desc = "Previous Symbol" },
    { "<M-n>", "<cmd>AerialNext<cr>", desc = "Next Symbol" },
  },
}
