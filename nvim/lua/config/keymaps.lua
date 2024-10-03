-- Keyvim.keymap.sets are automatically loaded on the VeryLazy event
-- Default keyvim.keymap.sets that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keyvim.keymap.sets here

-- Make , a second leader key
vim.cmd("nmap , <space>")

-- replace without losing clipboard content
vim.keymap.set("x", "<leader>p", '"_dP')

-- These are the one to get rid of copying to the system clipboard if I needed
-- vim.keymap.set("n", '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Yank to clipboard' })
-- vim.keymap.set({"v", "x"}, '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Yank to clipboard' })
-- vim.keymap.set({"n", "v", "x"}, '<leader>yy', '"+yy', { noremap = true, silent = true, desc = 'Yank line to clipboard' })
-- vim.keymap.set({"n", "v", "x"}, '<leader>Y', '"+yy', { noremap = true, silent = true, desc = 'Yank line to clipboard' })
-- vim.keymap.set({"n", "v", "x"}, '<C-a>', 'gg0vG$', { noremap = true, silent = true, desc = 'Select all' })
-- vim.keymap.set({'n', 'v', 'x'}, '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from clipboard' })
-- vim.keymap.set('i', '<C-p>', '<C-r>+', { noremap = true, silent = true, desc = 'Paste from clipboard from within insert mode' })
-- vim.keymap.set("x", "<leader>P", '"_dP', { noremap = true, silent = true, desc = 'Paste over selection without erasing unnamed register' })

-- Delete char without losing clipboard content
vim.keymap.set("n", "<S-x>", '"_x')
-- Delete without losing clipboard content
vim.keymap.set("v", "<S-x>", '"_d')

-- redo to shift U
vim.keymap.set({ "n", "x" }, "<S-u>", "<C-r>")

-- switch to last buffer
vim.keymap.set("n", "<C-q>", "<C-^>")

-- emacs keybindings in insert mod --
-- move-beginning-of-line
vim.keymap.set("!", "<C-a>", "<Home>")

-- move-end-of-line
vim.keymap.set("!", "<C-e>", "<End>", { noremap = true })

-- backward-word
vim.keymap.set("i", "<M-b>", "<C-Left>")
vim.keymap.set("c", "<M-b>", "<S-Left>")

-- forward-word
vim.keymap.set("i", "<M-f>", "<C-Right>")
vim.keymap.set("c", "<M-f>", "<S-Right>")

-- Move buffers in bufferline
vim.keymap.set("n", "<C-S-h>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer to left" })
vim.keymap.set("n", "<C-S-l>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to right" })
vim.keymap.set("n", "<S-Left>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer to left" })
vim.keymap.set("n", "<S-Right>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to right" })

-- Better scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center cursor after moving down half-page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center cursor after moving up half-page" })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Center cursor after moving down page" })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Center cursor after moving up page" })

-- MiniPairs
local map_MiniPairs = function(lhs, rhs)
  vim.keymap.set("i", lhs, rhs, { expr = true, replace_keycodes = false })
end
-- Backspace
map_MiniPairs("<C-h>", "v:lua.MiniPairs.bs()")
map_MiniPairs("<C-w>", 'v:lua.MiniPairs.bs("\23")')
map_MiniPairs("<C-BS>", 'v:lua.MiniPairs.bs("\23")')
-- Ctrl-j
map_MiniPairs("<C-j>", "v:lua.MiniPairs.cr()")

vim.keymap.set("c", "<C-BS>", "<C-w>")

-- delete registered keybindings with <leader>w from LazyVim because I delete the current buffer with <leader>w
-- NOTE: For now I'm removing the keys manually to improve startup time since I'm checking every update on LazyVim
-- and can eliminate the keys manually But this function can remove the keys automatically if needed
--
-- local function remove_leader_w_mappings()
--   local mappings = vim.api.nvim_get_keymap("n")
--   local leader = vim.g.mapleader or " "
--
--   for _, mapping in ipairs(mappings) do
--     -- Check if the lhs (left-hand side of the mapping) starts with <leader>w
--     if mapping.lhs:match("^" .. leader .. "w") then
--       vim.api.nvim_del_keymap("n", mapping.lhs)
--     end
--   end
-- end
-- remove_leader_w_mappings()

vim.keymap.del("n", "<leader>wm")
vim.keymap.del("n", "<leader>wd")
-- toggle maximize
LazyVim.toggle.map("<C-w>m", LazyVim.toggle.maximize)
-- remove current buffer
vim.keymap.set("n", "<leader>w", LazyVim.ui.bufremove, { desc = "Delete current buffer", noremap = true })
-- vim.keymap.set("n", "<leader>wq", LazyVim.ui.bufremove, { desc = "Delete current buffer", noremap = true })

-- Switch between <leader>uC and <leader>uc between conceallevel and changing the themes
LazyVim.toggle.map(
  "<leader>uC",
  LazyVim.toggle("conceallevel", { values = { 0, vim.o.conceallevel > 0 and vim.o.conceallevel or 2 } })
)

-- Gitui
vim.keymap.set("n", "<leader>gu", function()
  LazyVim.terminal.open({ "gitui" }, { cwd = LazyVim.root.get(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Gitui (root dir)" })
vim.keymap.set("n", "<leader>gU", function()
  LazyVim.terminal.open({ "gitui" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Gitui (cwd)" })

vim.keymap.set("n", "<leader>s'", require("telescope.builtin").resume, { desc = "Resume" })

-- Helix
vim.keymap.set({ "n", "x" }, "gh", "^")
vim.keymap.set({ "n", "x" }, "gl", "$")

-- Mini Move must overwrite lazyvim default bindings
vim.keymap.set("v", "<A-j>", function()
  require("mini.move").move_selection("down")
end)

vim.keymap.set("v", "<A-k>", function()
  require("mini.move").move_selection("up")
end)

vim.keymap.set("n", "<A-j>", function()
  require("mini.move").move_line("down")
end)

vim.keymap.set("n", "<A-k>", function()
  require("mini.move").move_line("up")
end)

vim.keymap.set({ "n", "x" }, "<C-c>", "<cmd>normal gcc<cr>", { desc = "Comment current line" })

-- Apply CSpell
vim.keymap.set("n", "<leader>uq", function()
  vim.notify("Activate CSpell", 2, { title = "option" })
  require("lint").try_lint("cspell")
end, { desc = "Apply CSpell lint" })

-- Reset buffer diagnostic
vim.keymap.set("n", "<leader>ut", function()
  vim.notify("Reset buffer diagnostic", 2, { title = "option" })
  vim.diagnostic.reset(nil, 0)
end, { desc = "Reset Diagnostic" })

-- Show buffer type (For debugging purposes)
vim.keymap.set("n", "<leader>bt", function()
  print(vim.bo.filetype)
end, { desc = "Show buffer type" })

vim.keymap.set("n", "<leader>gy", LazyVim.lazygit.blame_line, { desc = "Git Blame Line" })

-- disable Ctrl + U because I don't use it and only hit it by mistake
vim.keymap.set("i", "<C-u>", "")

-- Save current document without auto formatting or any other autocmds
vim.keymap.set({ "i", "n" }, "<C-S-s>", "<cmd>noa w<cr>", { desc = "Save without auto-format" })

vim.keymap.set("n", "z<space>", "zt", { desc = "Top this line" })

vim.keymap.set("n", "<leader>gm", "<cmd>G<cr>", { desc = "Git Fugitive" })

vim.keymap.set("n", "<c-/>", LazyVim.pick("live_grep", { root = false }), { desc = "Grep (cwd)" })
-- <c-_> for tmux and zellij can register as <c-/>
vim.keymap.set("n", "<c-_>", LazyVim.pick("live_grep", { root = false }), { desc = "Grep (cwd)" })

-- Disable hjkl and esc on toggle terminal + Change keybinding to <m-;> and <m-'>
vim.keymap.set("n", "<m-'>", function()
  LazyVim.terminal.open(nil, { esc_esc = false, ctrl_hjkl = false, border = "rounded" })
end, { desc = "Terminal (Root Dir)" })
vim.keymap.set("t", "<m-'>", "<cmd>close<cr>", { desc = "Hide Terminal" })

vim.keymap.set("n", "<m-;>", function()
  LazyVim.terminal.open(nil, { esc_esc = false, ctrl_hjkl = false, border = "rounded" })
end, { desc = "Terminal (Root Dir)" })
vim.keymap.set("t", "<m-;>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- disable <c-/> in terminal
vim.keymap.set("t", "<c-/>", "<c-/>")
