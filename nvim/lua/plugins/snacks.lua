return {
  "folke/snacks.nvim",
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        --- Logs a debug message with "DEBUG: " prepended, using `Snacks.debug.inspect`.
        vim.debug = function(...)
          Snacks.debug.inspect("DEBUG: " .. ...)
        end
      end,
    })
  end,

  opts = {
    words = {
      -- Snacks can't be disabled by default if we want to toggle it later.
      enabled = false,
      modes = { "n" }, -- modes to show references
      -- debounce = 150, -- time in ms to wait before updating
    },
    notifier = { enabled = false },
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
