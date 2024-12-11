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

-- Delete registered keybindings with <leader>w from LazyVim because I delete the current buffer with <leader>w
vim.keymap.del("n", "<leader>wm")
vim.keymap.del("n", "<leader>wd")

-- toggle maximize
LazyVim.ui.maximize():map("<C-w>m")
-- remove current buffer
vim.keymap.set("n", "<leader>w", function()
  Snacks.bufdelete()
end, { desc = "Delete current buffer", noremap = true })

-- Switch between <leader>uC and <leader>uc between conceallevel and changing the themes
Snacks.toggle
  .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
  :map("<leader>uC")

-- toggle Snacks words
Snacks.toggle.words():map("<leader>uv")

-- Gitui
vim.keymap.set("n", "<leader>gi", function()
  Snacks.terminal({ "gitui" }, { cwd = LazyVim.root.get(), win = { border = "rounded" } })
end, { desc = "Gitui (root dir)" })

-- LazyGit
vim.keymap.set("n", "<leader>gg", function()
  Snacks.lazygit({ cwd = LazyVim.root.git(), win = { border = "rounded" } })
end, { desc = "Lazygit (Root Dir)" })

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

vim.keymap.set("n", "<leader>gy", function()
  Snacks.git.blame_line()
end, { desc = "Git Blame Line" })

-- disable Ctrl + U because I don't use it and only hit it by mistake
vim.keymap.set("i", "<C-u>", "")

-- Save current document without auto formatting or any other autocmds
vim.keymap.set({ "i", "n" }, "<C-S-s>", "<cmd>noa w<cr>", { desc = "Save without auto-format" })
vim.keymap.set("n", "<leader>fs", "<cmd>noa w<cr>", { desc = "Save without auto-format" })

-- *** Neovim Development ***
vim.keymap.del("n", "<leader>.")
vim.keymap.set("n", "<leader>.s", "<cmd>source %<cr>", { desc = "Source current file" })
vim.keymap.set("n", "<leader>..", ":.lua<cr>", { desc = "Source current line" })
vim.keymap.set("v", "<leader>..", ":lua<cr>", { desc = "Source current selection" })
-- stylua: ignore
vim.keymap.set("n", "<leader>.x", function() Snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
-- stylua: ignore
vim.keymap.set("n", "<leader>.b", function() Snacks.scratch.select() end, { desc = "Select Scratch Buffer" })

vim.keymap.set("n", "z<space>", "zt", { desc = "Top this line" })

vim.keymap.set("n", "<leader>gm", "<cmd>G<cr>", { desc = "Git Fugitive" })

vim.keymap.set("n", "<leader>uz", "<cmd>colorscheme default<cr>", { desc = "Reset colorscheme" })

vim.keymap.set("n", "<leader>ux", "<cmd>ThemeVariantSwitch<cr>", { desc = "Switch theme varaint" })

-- Grep search with <ctrl-/>
vim.keymap.set("n", "<c-/>", LazyVim.pick("live_grep", { root = false }), { desc = "Grep (cwd)" })
-- <c-_> for tmux and zellij can register as <c-/>
vim.keymap.set("n", "<c-_>", LazyVim.pick("live_grep", { root = false }), { desc = "Grep (cwd)" })

-- Disable hjkl and esc on toggle terminal + Change keybinding to <m-;> and <m-:>
vim.keymap.set({ "n", "t" }, "<m-;>", function()
  Snacks.terminal()
end, { desc = "Toggle Terminal" })

vim.keymap.set({ "n", "t" }, "<m-:>", function()
  Snacks.terminal()
end, { desc = "Toggle Terminal" })

vim.keymap.set({ "n", "t" }, "<m-s-;>", function()
  Snacks.terminal()
end, { desc = "Toggle Terminal" })

-- disable <c-/> in terminal
vim.keymap.set("t", "<c-/>", "<c-/>")

-- Vim normal mode in terminal
vim.keymap.set("t", "<a-/>", "<c-\\><c-n>")
