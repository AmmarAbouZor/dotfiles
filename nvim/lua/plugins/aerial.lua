return {
  "stevearc/aerial.nvim",
  event = "VeryLazy",
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    layout = {
      default_direction = "prefer_right",
      min_width = 25,
    },
    lazy_load = true,

    buftype_exclude = {
      "nofile",
      "terminal",
    },
    filetype_exclude = {
      "help",
      "startify",
      "aerial",
      "alpha",
      "dashboard",
      "lazy",
      "neogitstatus",
      "NvimTree",
      "neo-tree",
      "Trouble",
    },

    keymaps = {
      ["<C-n>"] = "actions.down_and_scroll",
      ["<C-p>"] = "actions.up_and_scroll",
    },

    use_treesitter = true,
    -- backends = { "treesitter", "lsp", "markdown", "man" },
    backends = { "treesitter", "markdown", "man" },

    -- autojump = true,

    close_on_select = true,
  },
}
