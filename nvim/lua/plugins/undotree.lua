-- trying to hunt the memory leak
if true then
  return {}
end

return {
  "mbbill/undotree",
  event = "BufReadPost",
  keys = { { "<leader>y", "<cmd>UndotreeToggle<cr>", desc = "Toggle undo tree" } },
}
