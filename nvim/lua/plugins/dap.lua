return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      automatic_installation = false,

      ensure_installed = {
        "codelldb",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",

  -- stylua: ignore
    keys = {
        { "<leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
        { "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },

      -- Visual studio old habits 
        { "<F5>", function() require("dap").continue() end },
        { "<F10>", function() require("dap").step_over() end },
        { "<F11>", function() require("dap").step_into() end },
        { "<F12>", function() require("dap").step_out() end },
      },

    -- This is the config for rust but it seems to work without it.
    -- opts = function()
    --   local ok, mason_registry = pcall(require, "mason-registry")
    --   if ok then
    --     -- rust tools configuration for debugging support
    --     local codelldb = mason_registry.get_package("codelldb")
    --     local extension_path = codelldb:get_install_path() .. "/extension/"
    --     local codelldb_path = extension_path .. "adapter/codelldb"
    --     local liblldb_path = ""
    --
    --     print("Entered Masone-Registery")
    --
    --     local dap = require("dap")
    --
    --     dap.adapters.codelldb = {
    --       type = "server",
    --       port = "${port}",
    --       executable = {
    --         -- Change this to your path!
    --         command = codelldb_path,
    --         args = { "--port", "${port}" },
    --       },
    --     }
    --
    --     dap.configurations.rust = {
    --       {
    --         name = "Launch file",
    --         type = "codelldb",
    --         request = "launch",
    --         program = function()
    --           return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    --         end,
    --         cwd = "${workspaceFolder}",
    --         stopOnEntry = false,
    --       },
    --     }
    --   end
    -- end,
  },
  {
    "rcarriga/nvim-dap-ui",

    dependencies = { "nvim-neotest/nvim-nio" },

  -- stylua: ignore
  keys = {
---@diagnostic disable-next-line: missing-fields
    { "<leader>dd", function() require("dapui").eval(nil, { enter =  true }) end, desc = "Eval Enter", mode = {"n", "v"} },
  },
  },
}
