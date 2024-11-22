local palette, comment

if vim.o.background == "dark" then
  palette = {
    base00 = "#202020",
    base01 = "#2a2827",
    base02 = "#504945",
    base03 = "#5a524c",
    base04 = "#bdae93",
    base05 = "#ddc7a1",
    base06 = "#ebdbb2",
    base07 = "#fbf1c7",
    base08 = "#ea6962",
    base09 = "#e78a4e",
    base0A = "#d8a657",
    base0B = "#a9b665",
    base0C = "#89b482",
    base0D = "#7daea3",
    base0E = "#d3869b",
    base0F = "#bd6f3e",
  }
  comment = palette["base04"]
else
  palette = {
    base00 = "#f9f5d7",
    base01 = "#fbf1c7",
    base02 = "#e0cfa9",
    base03 = "#a89984",
    base04 = "#c9b99a",
    base05 = "#654735",
    base06 = "#3c3836",
    base07 = "#282828",
    base08 = "#c14a4a",
    base09 = "#c35e0a",
    base0A = "#b47109",
    base0B = "#6c782e",
    base0C = "#4c7a5d",
    base0D = "#45707a",
    base0E = "#945e80",
    base0F = "#e78a4e",
  }
  comment = palette["base05"]
end

require("mini.base16").setup({
  palette = palette,
})

vim.api.nvim_set_hl(0, "Comment", { fg = comment, italic = true })

vim.g.colors_name = "b16-gruvbox-mat-hard"
