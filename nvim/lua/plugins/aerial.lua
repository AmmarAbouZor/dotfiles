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

    use_treesitter = true,
    -- backends = { "treesitter", "lsp", "markdown", "man" },
    backends = { "treesitter", "markdown", "man" },

    -- autojump = true,

    close_on_select = true,
  },
}
