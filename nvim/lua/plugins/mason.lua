return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shfmt",
      -- "gopls",
      "pyright",
      "black",
      -- "solargraph", I installed it directly as gem so it's reachable from other programs as well
    },
  },
}
