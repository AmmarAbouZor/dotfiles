return {
  "folke/snacks.nvim",
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        Snacks.words.enabled = true
      end,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("Disable-Words-Start", { clear = true }),
      once = true,
      callback = function()
        -- HACK: Keep tracking until it's fixed on main stream.
        -- Dirty fix to disable words on start.
        -- Currently, words calls enable() on LSP attach event which will return early if
        -- enabled is already true. After two second we reset enabled to false, to make
        -- toggling works.
        vim.defer_fn(function()
          Snacks.words.enabled = false
        end, 2000)

        Snacks.toggle.words():map("<leader>uv")
      end,
    })
  end,

  opts = {
    words = {
      -- Snacks can't be disabled by default if we want to toggle it later.
      -- enabled = false,
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
