--- Logs a debug message with "DEBUG: " prepended, using `Snacks.debug.inspect`.
vim.debug = function(...)
  Snacks.debug.inspect("DEBUG: " .. ...)
end

-- vim.print = _G.dd
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
