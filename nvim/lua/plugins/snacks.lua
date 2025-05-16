return {
  {
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

    -- stylua: ignore
    keys = {
      { "<leader>uD", false },
      { "<leader>z", false },
      { "<leader>Z", false },
      { "<leader>ua", false },
      { "<leader>uS", false },
      { "<leader>S", false },
      { "<leader>gd", false },

      -- *** File explorer ***
      { "<leader>fe", function() Snacks.explorer({ auto_close = true }) end, desc = "Explorer Snacks (cwd)"},
      { "<leader>fE", function() Snacks.explorer({ cwd = LazyVim.root(), auto_close = true }) end, desc = "Explorer Snacks (root dir)"},
      { "<leader>e", "<leader>fe", desc = "Explorer Snacks (cwd)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer Snacks (root dir)", remap = true },

      -- *** Picker ***
      { "<leader>uc", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
      -- Include current in LSP references.
      { "gr", function() Snacks.picker.lsp_references({ include_current = true }) end, nowait = true, desc = "References" },
      { "<leader>s'", function() Snacks.picker.resume() end, desc = "Resume" },
      -- Change Diagnostics making severity at the top
      { "<leader>sd", function() Snacks.picker.diagnostics({ sort = { fields = { "severity", "is_current", "is_cwd", "file", "lnum", },},}) end, desc = "Diagnostics" },
      { "<leader>sD", function() Snacks.picker.diagnostics_buffer({sort = { fields = { "severity", "is_current", "is_cwd", "file", "lnum", },},}) end, desc = "Buffer Diagnostics" },
      -- Grep word allowing to fuzzy find buffers 
      { "<leader>s/", function() Snacks.picker.grep_word({ search = vim.fn.input("Grep > ") }) end, mode = "n", desc = "Grep word"},

      -- Use aerial for document symbols. This is repeated below in LSP section. 
      { "<leader>ss", function() require("aerial").snacks_picker() end, desc = "Document Symbols" },

      { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep (Open Buffers)" },
      { "<leader>ff", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "<leader><space>", function () Snacks.picker.files({hidden = true}) end, desc = "Find Files (cwd)" },
    },

    opts = {
      -- Disabled
      notifier = { enabled = false },
      dim = { enabled = false },
      zen = { enabled = false },
      animate = { enabled = false },
      scroll = { enabled = false },

      picker = {
        win = {
          -- input window
          input = {
            keys = {
              ["<c-m>"] = { "confirm", mode = { "n", "i" } },
              ["<a-CR>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
            },
          },
          -- result list window
          list = {
            keys = {
              ["<c-m>"] = { "confirm", mode = { "n", "i" } },
              ["<a-CR>"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
            },
          },
        },
      },

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
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local Keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- stylua: ignore
      vim.list_extend(Keys, {
        -- I need to override this to add include_current because lazyvim override it in its default configurations.
        { "gr", function() Snacks.picker.lsp_references({ include_current = true }) end, nowait = true, desc = "References" },
        -- Use aerial for document symbols.
        { "<leader>ss", function() require("aerial").snacks_picker() end, desc = "Document Symbols" },
      })
    end,
  },
}
