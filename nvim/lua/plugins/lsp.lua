return {
  "neovim/nvim-lspconfig",

  init = function()
    local lspconfig = require("lspconfig")

    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,

      cmd = {
        "rustup",
        "run",
        "stable",
        "rust-analyzer",
      },

      settings = {
        ["rust-analyzer"] = {
          completion = {
            callable = {
              snippets = "add_parentheses",
            },
          },
        },
      },
    })
  end,

  keys = {
    { "<leader>k", vim.lsp.buf.hover, desc = "Hover", silent = true },
    { "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action", silent = true },
  },
}
