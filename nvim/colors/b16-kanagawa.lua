local palette, comment, visual

if vim.o.background == "dark" then
  palette = {
    base00 = "#1F1F28",
    base01 = "#16161D",
    base02 = "#223249",
    base03 = "#54546D",
    base04 = "#727169",
    base05 = "#DCD7BA",
    base06 = "#C8C093",
    base07 = "#717C7C",
    base08 = "#C34043",
    base09 = "#FFA066",
    base0A = "#C0A36E",
    base0B = "#76946A",
    base0C = "#6A9589",
    base0D = "#7E9CD8",
    base0E = "#957FB8",
    base0F = "#D27E99",
  }
  visual = palette["base03"]
else
  palette = {
    base00 = "#fff5e5",
    base01 = "#ece4d6",
    base02 = "#d9d3c8",
    base03 = "#7f8080",
    base04 = "#5d6065",
    base05 = "#4e5359",
    base06 = "#4e5359",
    base07 = "#4e5359",
    base08 = "#b14745",
    base09 = "#a25600",
    base0A = "#876500",
    base0B = "#557300",
    base0C = "#0e7767",
    base0D = "#246da5",
    base0E = "#7a50c6",
    base0F = "#a83f92",
  }
  visual = palette["base02"]
end

require("mini.base16").setup({
  palette = palette,
})

comment = palette["base07"]
vim.api.nvim_set_hl(0, "Comment", { fg = comment, italic = true })

vim.api.nvim_set_hl(0, "Visual", { bg = visual })

vim.g.colors_name = "b16-kanagawa"
