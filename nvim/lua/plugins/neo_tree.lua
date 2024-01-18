return {
  "nvim-neo-tree/neo-tree.nvim",

  opts = {
    buffers = {
      window = {
        mappings = {
          ["x"] = "buffer_delete",
        },
      },
    },
  },

  -- Disable default lazygit settings to hunt down the memory leak when moving and deleting files
  config = function(_, opts)
    require("neo-tree").setup(opts)
  end,
}
