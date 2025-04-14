-- Provide methods and keybindings to insert special keywords inside comments.

-- Gets the formatted comment string (e.g., "// FIXME ") or nil on failure
---@param keyword string - e.g., "TODO", "FIXME", "NOTE"
local function get_formatted_comment(keyword)
  if not keyword or keyword == "" then
    error("No keyword provided for comment insertion")
  end

  local comment_string = vim.bo.commentstring
  if comment_string and comment_string:match("%%s") then
    -- Format the comment string placeholder '%s' with the keyword.
    -- Ensure there's a space before and after the keyword for readability
    -- and so you can start typing immediately after the keyword.
    return string.format(comment_string, keyword)
  else
    -- Warn and return Nil if we cannot determine the comment string properly.
    local msg = "Error: Cannot determine comment string for this filetype."
    LazyVim.error(msg)

    return nil
  end
end

-- Opens a new line above/below and inserts the keyword comment
---@param above boolean - true for line above, false for line below
---@param keyword (string) - The keyword to insert (e.g., "TODO")
local function insert_comment_newline(above, keyword)
  local formatted_comment = get_formatted_comment(keyword)
  if formatted_comment then
    local open_cmd = above and "O" or "o"
    vim.api.nvim_feedkeys(open_cmd .. formatted_comment, "nt", false)
  end
end

-- Inserts keyword comment at the current cursor position
---@param keyword string - The keyword to insert (e.g., "FIXME")
local function insert_comment_at_cursor(keyword)
  local formatted_comment = get_formatted_comment(keyword)
  if formatted_comment then
    vim.api.nvim_feedkeys("i" .. formatted_comment, "nt", false)
  end
end

-- --- Keymaps ---
local my_todo = "TODO AAZ: "

-- Map for adding TODO comment on a new line BELOW current line
vim.keymap.set("n", "<leader>to", function()
  insert_comment_newline(false, my_todo)
end, { noremap = true, silent = true, desc = "Insert TODO comment on new line below" })

-- Map for adding TODO comment on a new line ABOVE current line
vim.keymap.set("n", "<leader>tO", function()
  insert_comment_newline(true, my_todo)
end, { noremap = true, silent = true, desc = "Insert TODO comment on new line above" })

-- Map for adding TODO comment AT CURSOR position (renamed from <leader>z)
vim.keymap.set("n", "<leader>tz", function()
  insert_comment_at_cursor(my_todo)
end, { noremap = true, silent = true, desc = "Insert TODO comment at cursor" })

vim.keymap.set(
  "n",
  "<leader>tt",
  "i" .. my_todo,
  { noremap = true, silent = true, desc = "Insert TODO text at cursor" }
)

return {}
