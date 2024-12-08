return {
  "folke/snacks.nvim",
  opts = {
    words = {
      enabled = false,
      -- modes = { "n" }, -- modes to show references
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
