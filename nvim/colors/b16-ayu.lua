local palette, comment

if vim.o.background == "dark" then
  palette = {
    base00 = "#0F1419",
    base01 = "#131721",
    base02 = "#373D48",
    base03 = "#3E4B59",
    base04 = "#BFBDB6",
    base05 = "#E6E1CF",
    base06 = "#E6E1CF",
    base07 = "#F3F4F5",
    base08 = "#F07178",
    base09 = "#FF8F40",
    base0A = "#FFB454",
    base0B = "#B8CC52",
    base0C = "#95E6CB",
    base0D = "#59C2FF",
    base0E = "#D2A6FF",
    base0F = "#E6B673",
  }
else
  palette = {
    base00 = "#FAFAFA",
    base01 = "#F3F4F5",
    base02 = "#D8D9DA",
    base03 = "#ABB0B6",
    base04 = "#828C99",
    base05 = "#5C6773",
    base06 = "#242936",
    base07 = "#1A1F29",
    base08 = "#F07178",
    base09 = "#FA8D3E",
    base0A = "#F2AE49",
    base0B = "#86B300",
    base0C = "#4CBF99",
    base0D = "#36A3D9",
    base0E = "#A37ACC",
    base0F = "#E6BA7E",
  }
end

require("mini.base16").setup({ palette = palette })
comment = palette["base04"]
vim.api.nvim_set_hl(0, "Comment", { fg = comment, italic = true })

vim.g.colors_name = "b16-ayu"
