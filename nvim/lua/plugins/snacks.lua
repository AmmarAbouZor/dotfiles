return {
  "folke/snacks.nvim",
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        --- Logs a debug message with "DEBUG: " prepended, using `Snacks.debug.inspect`.
        _G.dd = function(...)
          Snacks.debug.inspect("DEBUG: " .. ...)
        end
        vim.debug = _G.dd
      end,
    })
  end,

  keys = {
    { "<leader>uD", false },
    { "<leader>z", false },
    { "<leader>Z", false },
    { "<leader>ua", false },
    { "<leader>uS", false },
    { "<leader>S", false },
    {
      "<leader>fe",
      function()
        Snacks.explorer({ auto_close = true })
      end,
      desc = "Explorer Snacks (cwd)",
    },
    {
      "<leader>fE",
      function()
        Snacks.explorer({ cwd = LazyVim.root(), auto_close = true })
      end,
      desc = "Explorer Snacks (root dir)",
    },
    { "<leader>e", "<leader>fe", desc = "Explorer Snacks (cwd)", remap = true },
    { "<leader>E", "<leader>fE", desc = "Explorer Snacks (root dir)", remap = true },
  },

  opts = {
    -- Disabled
    notifier = { enabled = false },
    dim = { enabled = false },
    zen = { enabled = false },
    animate = { enabled = false },
    scroll = { enabled = false },
    input = { enabled = false },

    scratch = {
      ft = "lua",
      filekey = {
        name = true,
        ft = true,
        cwd = false, -- use current working directory
        branch = false, -- use current branch name
        count = false, -- use vim.v.count1
      },
    },
    words = {
      -- Snacks can't be disabled by default if we want to toggle it later.
      enabled = false,
      modes = { "n" }, -- modes to show references
      -- debounce = 150, -- time in ms to wait before updating
    },
    indent = {
      animate = { enabled = false },
      scope = { enabled = false },
    },
    terminal = {
      win = {
        -- Disable default navigations with <C-..>
        keys = {
          nav_h = false,
          nav_j = false,
          nav_k = false,
          nav_l = false,
        },
        -- Terminal is bordered and centered by default
        position = "float",
        border = "rounded",
      },
    },
    dashboard = {
      preset = {
        header = [[

   _      _      _      _      _      _      _      _      _      _   
 _( )_  _( )_  _( )_  _( )_  _( )_  _( )_  _( )_  _( )_  _( )_  _( )_ 
(_ o _)(_ o _)(_ o _)(_ o _)(_ o _)(_ o _)(_ o _)(_ o _)(_ o _)(_ o _)
 (_,_)  (_,_)  (_,_)  (_,_)  (_,_)  (_,_)  (_,_)  (_,_)  (_,_)  (_,_) 
   _                                                              _   
 _( )_                                                          _( )_ 
(_ o _)    ██████╗ ██████╗ ███████╗ █████╗ ████████╗██╗  ██╗   (_ o _)
 (_,_)     ██╔══██╗██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██║  ██║    (_,_) 
   _       ██████╔╝██████╔╝█████╗  ███████║   ██║   ███████║      _   
 _( )_     ██╔══██╗██╔══██╗██╔══╝  ██╔══██║   ██║   ██╔══██║    _( )_ 
(_ o _)    ██████╔╝██║  ██║███████╗██║  ██║   ██║   ██║  ██║   (_ o _)
 (_,_)     ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝    (_,_) 
   _      _      _      _      _      _      _      _      _      _   
 _( )_  _( )_  _( )_  _( )_  _( )_  _( )_  _( )_  _( )_  _( )_  _( )_ 
(_ o _)(_ o _)(_ o _)(_ o _)(_ o _)(_ o _)(_ o _)(_ o _)(_ o _)(_ o _)
 (_,_)  (_,_)  (_,_)  (_,_)  (_,_)  (_,_)  (_,_)  (_,_)  (_,_)  (_,_) 

]],
      },
    },
  },
}
