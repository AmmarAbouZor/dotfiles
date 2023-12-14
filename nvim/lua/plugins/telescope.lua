return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>uC",
      function()
        -- Load all themes
        require("tokyonight")
        require("github-theme")
        require("everforest")
        require("lazy").load({ plugins = { "gruvbox-material" } })

        -- Then Open telescope themes picker
        require("lazyvim.util").telescope("colorscheme", { enable_preview = true })()
      end,
      desc = "Colorscheme with preview",
    },
    -- I'm using Diffview for that
    -- {
    --   "<leader>gf",
    --   "<cmd>Telescope git_bcommits<cr>",
    --   desc = "Current file history",
    -- },
    { "<leader>bb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
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
