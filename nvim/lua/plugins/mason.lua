return {
  {
    "mason-org/mason.nvim",
    -- Mason doesn't work well with NixOS, besides installing LSPs with nix is more simple.
    enabled = false,
    opts = {
      ensure_installed = {
        -- "stylua",
        -- "shfmt",
        -- "gopls",
        -- "pyright",
        -- "black",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    enabled = false,
  },
}
