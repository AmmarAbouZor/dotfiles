require("mini.base16").setup({
  palette = {
    base00 = "#1C2023",
    base01 = "#393F45",
    base02 = "#565E65",
    base03 = "#747C84",
    base04 = "#ADB3BA",
    base05 = "#C7CCD1",
    base06 = "#DFE2E5",
    base07 = "#F3F4F5",
    base08 = "#C7AE95",
    base09 = "#C7C795",
    base0A = "#AEC795",
    base0B = "#95C7AE",
    base0C = "#95AEC7",
    base0D = "#AE95C7",
    base0E = "#C795AE",
    base0F = "#C79595",
  },
})

vim.api.nvim_set_hl(0, "Comment", { fg = "#ADB3BA", italic = true })

vim.g.colors_name = "b16-ashes"
