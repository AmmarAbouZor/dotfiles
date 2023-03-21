return {
  "echasnovski/mini.pairs",
  opts = {
    -- restrict ' with < and & for rust
    mappings = {
      ["'"] = { neigh_pattern = "[^%a\\|<|&]." },
    },
  },
}
