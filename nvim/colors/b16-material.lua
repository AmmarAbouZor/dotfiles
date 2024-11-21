local palette, comment, visual

if vim.o.background == "dark" then
  palette = {
    base00 = "#263238",
    base01 = "#2E3C43",
    base02 = "#314549",
    base03 = "#546E7A",
    base04 = "#B2CCD6",
    base05 = "#EEFFFF",
    base06 = "#EEFFFF",
    base07 = "#FFFFFF",
    base08 = "#F07178",
    base09 = "#F78C6C",
    base0A = "#FFCB6B",
    base0B = "#C3E88D",
    base0C = "#89DDFF",
    base0D = "#82AAFF",
    base0E = "#C792EA",
    base0F = "#FF5370",
  }
  visual = palette["base03"]
else
  palette = {
    base00 = "#FAFAFA",
    base01 = "#E7EAEC",
    base02 = "#CCEAE7",
    base03 = "#CCD7DA",
    base04 = "#8796B0",
    base05 = "#80CBC4",
    base06 = "#80CBC4",
    base07 = "#FFFFFF",
    base08 = "#FF5370",
    base09 = "#F76D47",
    base0A = "#FFB62C",
    base0B = "#91B859",
    base0C = "#39ADB5",
    base0D = "#6182B8",
    base0E = "#7C4DFF",
    base0F = "#E53935",
  }
  visual = palette["base03"]
end

require("mini.base16").setup({
  palette = palette,
})

comment = palette["base04"]
vim.api.nvim_set_hl(0, "Comment", { fg = comment, italic = true })
vim.api.nvim_set_hl(0, "Visual", { bg = visual })

vim.g.colors_name = "b16-material"
