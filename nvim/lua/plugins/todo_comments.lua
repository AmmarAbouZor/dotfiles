return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  opts = {
    highlight = {
      multiline = false, -- enable multine todo comments
      before = "", -- "fg" or "bg" or empty
      keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
      after = "", -- "fg" or "bg" or empty
    },

    keywords = {
      TODO = { icon = " ", color = "info", alt = { "TODO AAZ", "TODO AMMAR" } },
    },
  },
}
