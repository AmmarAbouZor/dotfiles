require("mini.base16").setup({
  palette = {
    base00 = "#272e33",
    base01 = "#2e383c",
    base02 = "#414b50",
    base03 = "#859289",
    base04 = "#9da9a0",
    base05 = "#d3c6aa",
    base06 = "#edeada",
    base07 = "#fffbef",
    base08 = "#e67e80",
    base09 = "#e69875",
    base0A = "#dbbc7f",
    base0B = "#a7c080",
    base0C = "#83c092",
    base0D = "#7fbbb3",
    base0E = "#d699b6",
    base0F = "#9da9a0",
  },
})

vim.api.nvim_set_hl(0, "Comment", { fg = "#9da9a0", italic = true })
vim.g.colors_name = "b16-everforest"
