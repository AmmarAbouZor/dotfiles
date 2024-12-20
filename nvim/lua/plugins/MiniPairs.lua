return {
  "echasnovski/mini.pairs",
  opts = {
    modes = { insert = true, command = false, terminal = false },
    -- disable auto pairs in strings and comments
    skip_ts = { "string", "comment" },

    mappings = {
      -- restrict ' with < and & for rust
      ["'"] = { neigh_pattern = "[^%a\\|'|<|&]." },
      -- Add | for rust iterations
      ["|"] = { action = "closeopen", pair = "||", neigh_pattern = "[(][)]", register = { cr = false } },
    },
  },
}
