return {
  "stevearc/oil.nvim",

  opts = {
    default_file_explorer = false,
    prompt_save_on_select_new_entry = false,
    keymaps = {
      ["<BS>"] = "actions.parent",
      ["<C-s>"] = false,
      -- ["_"] = "actions.open_cwd",
    },

    float = {
      padding = 5,
      max_height = 40,
      max_width = 100,
    },
  },

  keys = {
    {
      "<leader>fo",
      function()
        require("oil").open_float()
      end,
      desc = "Oil Open",
    },
  },

  -- to hijake newtree stuff
  -- init = function()
  --   if vim.fn.argc(-1) == 1 then
  --     local stat = vim.loop.fs_stat(vim.fn.argv(0))
  --     if stat and stat.type == "directory" then
  --       require("oil")
  --     end
  --   end
  -- end,
}
