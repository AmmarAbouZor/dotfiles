local palette, comment, visual

if vim.o.background == "dark" then
  palette = {
    base00 = "#24273a",
    base01 = "#1e2030",
    base02 = "#363a4f",
    base03 = "#494d64",
    base04 = "#5b6078",
    base05 = "#cad3f5",
    base06 = "#f4dbd6",
    base07 = "#b7bdf8",
    base08 = "#ed8796",
    base09 = "#f5a97f",
    base0A = "#eed49f",
    base0B = "#a6da95",
    base0C = "#8bd5ca",
    base0D = "#8aadf4",
    base0E = "#c6a0f6",
    base0F = "#f0c6c6",
  }
else
  palette = {
    base00 = "#eff1f5",
    base01 = "#e6e9ef",
    base02 = "#ccd0da",
    base03 = "#bcc0cc",
    base04 = "#acb0be",
    base05 = "#4c4f69",
    base06 = "#dc8a78",
    base07 = "#7287fd",
    base08 = "#d20f39",
    base09 = "#fe640b",
    base0A = "#df8e1d",
    base0B = "#40a02b",
    base0C = "#179299",
    base0D = "#1e66f5",
    base0E = "#8839ef",
    base0F = "#dd7878",
  }
end

require("mini.base16").setup({
  palette = palette,
})

comment = palette["base07"]
vim.api.nvim_set_hl(0, "Comment", { fg = comment, italic = true })

visual = palette["base03"]
vim.api.nvim_set_hl(0, "Visual", { bg = visual })

vim.g.colors_name = "b16-cat-macch"
