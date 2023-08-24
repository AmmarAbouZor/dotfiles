return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  lazy = true,
  keys = function()
    return {
      {
        "<leader>k",
        mode = "n",
        desc = "Harpoon",
      },
      {
        "<leader>kk",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        mode = "n",
        desc = "Open Harpoon Menu",
      },
      {
        "<leader>ka",
        function()
          require("harpoon.mark").add_file()
        end,
        mode = "n",
        desc = "Add Harpoon File",
      },
      {
        "<leader>kn",
        function()
          require("harpoon.ui").nav_next() -- navigates to next mark
        end,
        mode = "n",
        desc = "Next Harpoon File",
      },
      {
        "<leader>kp",
        function()
          require("harpoon.ui").nav_prev() -- navigates to previous mark
        end,
        mode = "n",
        desc = "Previous Harpoon File",
      },
    }
  end,
}
