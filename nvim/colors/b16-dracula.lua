local palette, comment
if vim.o.background == "dark" then
  palette = {
    base00 = "#282a36",
    base01 = "#363447",
    base02 = "#44475a",
    base03 = "#6272a4",
    base04 = "#9ea8c7",
    base05 = "#f8f8f2",
    base06 = "#f0f1f4",
    base07 = "#ffffff",
    base08 = "#ff5555",
    base09 = "#ffb86c",
    base0A = "#f1fa8c",
    base0B = "#50fa7b",
    base0C = "#8be9fd",
    base0D = "#80bfff",
    base0E = "#ff79c6",
    base0F = "#bd93f9",
  }
else
  palette = {
    base00 = "#d1d6db",
    base01 = "#aeb6be",
    base02 = "#909aa3",
    base03 = "#75808a",
    base04 = "#47505a",
    base05 = "#323b43",
    base06 = "#20262c",
    base07 = "#0f1316",
    base08 = "#576d82",
    base09 = "#578282",
    base0A = "#57826d",
    base0B = "#6d8257",
    base0C = "#826d57",
    base0D = "#82576d",
    base0E = "#6d5782",
    base0F = "#575782",
  }
end

require("mini.base16").setup({
  palette = palette,
})

comment = palette["base04"]
vim.api.nvim_set_hl(0, "Comment", { fg = comment, italic = true })

vim.g.colors_name = "b16-dracula"
