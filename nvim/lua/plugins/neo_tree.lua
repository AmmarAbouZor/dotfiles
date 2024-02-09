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

    -- Close tree when file is opened
    event_handlers = {
      {
        event = "file_opened",
        handler = function(file_path)
          --auto close
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },

    -- This helps to show the new tree in full screen when open vim with a directory as argument
    filesystem = {
      hijack_netrw_behavior = "open_current",
      -- hijack_netrw_behavior = "disabled",
    },
  },

  -- This disable neotree when neovim is started with directory as an argument.
  -- init = function() end,

  -- This shows the new tree in full screen when open vim with a directory as argument
  init = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      -- make a group to be able to delete it later
      group = vim.api.nvim_create_augroup("NeoTreeInit", { clear = true }),
      callback = function()
        local f = vim.fn.expand("%:p")
        if vim.fn.isdirectory(f) ~= 0 then
          require("neo-tree")
          -- vim.cmd("Neotree current dir=" .. f)
          -- neo-tree is loaded now, delete the init autocmd
          vim.api.nvim_clear_autocmds({ group = "NeoTreeInit" })
        end
      end,
    })

    -- keymaps
  end,

  -- Disable default lazygit settings to hunt down the memory leak when moving and deleting files
  config = function(_, opts)
    require("neo-tree").setup(opts)
  end,
}
