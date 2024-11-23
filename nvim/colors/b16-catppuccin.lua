local palette, comment, visual

if vim.o.background == "dark" then
  palette = {
    base00 = "#1e1e2e",
    base01 = "#181825",
    base02 = "#313244",
    base03 = "#45475a",
    base04 = "#585b70",
    base05 = "#cdd6f4",
    base06 = "#f5e0dc",
    base07 = "#b4befe",
    base08 = "#f38ba8",
    base09 = "#fab387",
    base0A = "#f9e2af",
    base0B = "#a6e3a1",
    base0C = "#94e2d5",
    base0D = "#89b4fa",
    base0E = "#cba6f7",
    base0F = "#f2cdcd",
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

vim.g.colors_name = "b16-catppuccin"
