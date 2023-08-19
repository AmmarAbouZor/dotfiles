return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  lazy = true,
  keys = function()
    return {
      {
        "<leader>ka",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        mode = "n",
      },
      {
        "<leader>kk",
        function()
          require("harpoon.mark").add_file()
        end,
        mode = "n",
      },
      {
        "<leader>kn",
        function()
          require("harpoon.ui").nav_next() -- navigates to next mark
        end,
        mode = "n",
      },
      {
        "<leader>kp",
        function()
          require("harpoon.ui").nav_prev() -- navigates to previous mark
        end,
        mode = "n",
      },
    }
  end,
}
