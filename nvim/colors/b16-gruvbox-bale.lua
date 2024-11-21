local palette, comment

if vim.o.background == "dark" then
  palette = {
    base00 = "#262626",
    base01 = "#3a3a3a",
    base02 = "#4e4e4e",
    base03 = "#8a8a8a",
    base04 = "#949494",
    base05 = "#dab997",
    base06 = "#d5c4a1",
    base07 = "#ebdbb2",
    base08 = "#d75f5f",
    base09 = "#ff8700",
    base0A = "#ffaf00",
    base0B = "#afaf00",
    base0C = "#85ad85",
    base0D = "#83adad",
    base0E = "#d485ad",
    base0F = "#d65d0e",
  }
  comment = "#caa987"
else
  palette = {
    base00 = "#fbf1c7",
    base01 = "#ebdbb2",
    base02 = "#d5c4a1",
    base03 = "#bdae93",
    base04 = "#665c54",
    base05 = "#504945",
    base06 = "#3c3836",
    base07 = "#282828",
    base08 = "#9d0006",
    base09 = "#af3a03",
    base0A = "#b57614",
    base0B = "#79740e",
    base0C = "#427b58",
    base0D = "#076678",
    base0E = "#8f3f71",
    base0F = "#d65d0e",
  }
  comment = palette["base04"]
end

require("mini.base16").setup({
  palette = palette,
})

vim.api.nvim_set_hl(0, "Comment", { fg = comment, italic = true })

vim.g.colors_name = "b16-gruvbox-bale"
