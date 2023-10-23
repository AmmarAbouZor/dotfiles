return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>uC",
      function()
        -- Load all themes
        require("tokyonight")
        require("github-theme")
        require("gruvbox")
        require("everforest")
        -- Then Open telescope themes picker
        require("lazyvim.util").telescope("colorscheme", { enable_preview = true })()
      end,
      desc = "Colorscheme with preview",
    },
    {
      "<leader>gf",
      "<cmd>Telescope git_bcommits<cr>",
      desc = "Current file history",
    },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
        },
      },
      mappings = {
        n = {
          ["x"] = function(...)
            return require("telescope.actions").delete_buffer(...)
          end,
        },
      },
    },
  },
}
