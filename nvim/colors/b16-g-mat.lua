local palette, comment
if vim.o.background == "dark" then
  palette = {
    base00 = "#292828",
    base01 = "#32302f",
    base02 = "#504945",
    base03 = "#665c54",
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
else
  palette = {
    base00 = "#fbf1c7",
    base01 = "#f2e5bc",
    base02 = "#d5c4a1",
    base03 = "#bdae93",
    base04 = "#665c54",
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
end

require("mini.base16").setup({
  palette = palette,
})

comment = palette["base04"]
vim.api.nvim_set_hl(0, "Comment", { fg = comment, italic = true })

vim.g.colors_name = "b16g-mat"
