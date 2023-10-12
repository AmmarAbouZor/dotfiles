return {
  "echasnovski/mini.pairs",
  opts = {
    mappings = {
      -- restrict ' with < and & for rust
      ["'"] = { neigh_pattern = "[^%a\\|'|<|&]." },
      -- Add | for rust iterations
      ["|"] = { action = "closeopen", pair = "||", neigh_pattern = "[(][)]", register = { cr = false } },
    },
  },
}
