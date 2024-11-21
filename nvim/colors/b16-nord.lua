local palette, comment

if vim.o.background == "dark" then
  palette = {
    base00 = "#2E3440",
    base01 = "#3B4252",
    base02 = "#434C5E",
    base03 = "#4C566A",
    base04 = "#D8DEE9",
    base05 = "#E5E9F0",
    base06 = "#ECEFF4",
    base07 = "#8FBCBB",
    base08 = "#BF616A",
    base09 = "#D08770",
    base0A = "#EBCB8B",
    base0B = "#A3BE8C",
    base0C = "#88C0D0",
    base0D = "#81A1C1",
    base0E = "#B48EAD",
    base0F = "#5E81AC",
  }
  comment = "#A8AEB9"
else
  palette = {
    base00 = "#e5e9f0",
    base01 = "#c2d0e7",
    base02 = "#b8c5db",
    base03 = "#aebacf",
    base04 = "#60728c",
    base05 = "#2e3440",
    base06 = "#3b4252",
    base07 = "#29838d",
    base08 = "#99324b",
    base09 = "#ac4426",
    base0A = "#9a7500",
    base0B = "#4f894c",
    base0C = "#398eac",
    base0D = "#3b6ea8",
    base0E = "#97365b",
    base0F = "#5272af",
  }
  comment = palette["base04"]
end

require("mini.base16").setup({
  palette = palette,
})

vim.api.nvim_set_hl(0, "Comment", { fg = comment, italic = true })

vim.g.colors_name = "b16-nord"
