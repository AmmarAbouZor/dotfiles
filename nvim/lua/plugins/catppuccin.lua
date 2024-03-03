if vim.g.neovide then
  return {}
end

return {
  {
    "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      -- I have the workaround applied in kitty theme and don't need it here.
      kitty = false,

      integrations = {
        cmp = true,
        aerial = true,
        indent_blankline = false,
        fidget = true,
        harpoon = true,
        neotree = true,
        dashboard = true,
        which_key = true,
      },

      custom_highlights = function(C)
        return {
          -- This is for the messages at the bottom of the screen
          MsgSeparator = { bg = C.mantle },

          -- This removes the black background on the popup window that after the cmp popup is shown
          NormalFloat = {
            fg = C.text,
            bg = (require("catppuccin").options.transparent_background and vim.o.winblend == 0) and C.base or C.mantle,
          },
        }
      end,

      -- This will be kept only for the case if I reactivate nvim-notify
      -- transparent background mode sets the background to none
      -- which invoke a warning nvim-notify
      -- custom_highlights = function(_)
      --   return {
      --     NotifyBackground = { bg = "#000000" },
      --   }
      -- end,
    },
  },
}
