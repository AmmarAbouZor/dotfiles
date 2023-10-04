-- this is for <C-n> like in visual studio
return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",

  init = function()
    vim.cmd("let g:VM_maps = {}")
    vim.cmd("let g:VM_maps['Find Under'] = '<A-m>'")
    vim.cmd("let g:VM_maps['Find Subword Under'] = '<A-m>'")
  end,
}
