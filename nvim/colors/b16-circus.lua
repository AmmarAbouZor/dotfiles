local palette, comment, visual
if vim.o.background == "dark" then
  palette = {
    base00 = "#191919",
    base01 = "#202020",
    base02 = "#303030",
    base03 = "#5f5a60",
    base04 = "#505050",
    base05 = "#a7a7a7",
    base06 = "#808080",
    base07 = "#ffffff",
    base08 = "#dc657d",
    base09 = "#4bb1a7",
    base0A = "#c3ba63",
    base0B = "#84b97c",
    base0C = "#4bb1a7",
    base0D = "#639ee4",
    base0E = "#b888e2",
    base0F = "#b888e2",
  }
  visual = "#404040"
  comment = palette["base05"]
else
  palette = {
    base00 = "#e0e0e0",
    base01 = "#d0dad0",
    base02 = "#d0d0d0",
    base03 = "#707070",
    base04 = "#202020",
    base05 = "#000000",
    base06 = "#f8f8f8",
    base07 = "#c4d9c4",
    base08 = "#840000",
    base09 = "#006565",
    base0A = "#755B00",
    base0B = "#730073",
    base0C = "#755B00",
    base0D = "#007300",
    base0E = "#000090",
    base0F = "#755B00",
  }
  visual = palette["base07"]
  comment = palette["base04"]
end

require("mini.base16").setup({
  palette = palette,
})

vim.api.nvim_set_hl(0, "Comment", { fg = comment, italic = true })
vim.api.nvim_set_hl(0, "Visual", { bg = visual })

vim.g.colors_name = "b16-circus"
