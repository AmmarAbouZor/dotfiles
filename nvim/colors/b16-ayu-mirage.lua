local palette, comment, visual

if vim.o.background == "dark" then
  palette = {
    base00 = "#171B24",
    base01 = "#1F2430",
    base02 = "#343946",
    base03 = "#707A8C",
    base04 = "#8A9199",
    base05 = "#CCCAC2",
    base06 = "#D9D7CE",
    base07 = "#F3F4F5",
    base08 = "#F28779",
    base09 = "#FFAD66",
    base0A = "#FFD173",
    base0B = "#D5FF80",
    base0C = "#95E6CB",
    base0D = "#5CCFE6",
    base0E = "#D4BFFF",
    base0F = "#F29E74",
  }
  comment = "#9AA1A9"
  visual = "#404A5C"
else
  palette = {
    base00 = "#FAFAFA",
    base01 = "#F3F4F5",
    base02 = "#F8F9FA",
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
  comment = palette["base04"]
  visual = "#CBD0D6"
end

require("mini.base16").setup({ palette = palette })
vim.api.nvim_set_hl(0, "Comment", { fg = comment, italic = true })
vim.api.nvim_set_hl(0, "Visual", { bg = visual })

vim.g.colors_name = "b16-ayu-mirage"
