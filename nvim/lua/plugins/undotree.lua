-- trying to hunt the memory leak
if true then
  return {}
end

return {
  "mbbill/undotree",
  keys = { { "<leader>y", "<cmd>UndotreeToggle<cr>", desc = "Toggle undo tree" } },
}
