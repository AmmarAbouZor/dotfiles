-- this is for <C-n> like in visual studio
return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",

  init = function()
    -- Disable default mapping and set the needed mapping only
    vim.cmd([[
      let VM_default_mappings = 0
      let g:VM_maps = {}
      let g:VM_maps['Find Under'] = '<C-m>'
      let g:VM_maps['Find Subword Under'] = '<C-m>'
    ]])
  end,
}
