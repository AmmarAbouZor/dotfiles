local palette, comment

if vim.o.background == "dark" then
  palette = {
    base00 = "#1a1a1a",
    base01 = "#222222",
    base02 = "#393939",
    base03 = "#767676",
    base04 = "#b8b8b8",
    base05 = "#cccccc",
    base06 = "#e8e8e8",
    base07 = "#f8f8f8",
    base08 = "#d88568",
    base09 = "#d86868",
    base0A = "#b99353",
    base0B = "#83a471",
    base0C = "#7c9cae",
    base0D = "#8eccdd",
    base0E = "#b98eb2",
    base0F = "#8b6c37",
  }
  comment = "#a8a8a8"
else
  palette = {
    base00 = "#f6f6f6",
    base01 = "#dedede",
    base02 = "#bde5f2",
    base03 = "#898989",
    base04 = "#767676",
    base05 = "#181818",
    base06 = "#e8e8e8",
    base07 = "#f8f8f8",
    base08 = "#9c5a02",
    base09 = "#c43e18",
    base0A = "#c48218",
    base0B = "#38781c",
    base0C = "#2d6bb1",
    base0D = "#48bac2",
    base0E = "#a94598",
    base0F = "#8b6c37",
  }
  comment = palette["base03"]
end

require("mini.base16").setup({
  palette = palette,
})

vim.api.nvim_set_hl(0, "Comment", { fg = comment, italic = true })

vim.g.colors_name = "b16-ia"
