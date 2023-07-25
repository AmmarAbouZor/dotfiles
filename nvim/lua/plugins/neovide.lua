if vim.g.neovide then
  -- FONTS
  -- vim.o.guifont = "Monaco:h12"
  vim.o.guifont = "Fira code:h12"
  -- vim.o.guifont = "SF Mono:h12"
  -- vim.o.guifont = "JetBrains mono:h12"
  -- vim.o.guifont = "Cascadia Code:h13"
  -- vim.o.guifont = "roboto mono:h12"
  -- vim.o.guifont = "DejaVu sans Mono:h12"
  -- vim.o.guifont = "Blex Mono Nerd Font:h12"
  -- vim.o.guifont = "monospace:h12"

  -- Conigurations

  -- vim.g.neovide_transparency = 0.9
  -- vim.g.transparency = 0.7

  -- vim.g.neovide_floating_blur_amount_x = 3.0
  -- vim.g.neovide_floating_blur_amount_y = 3.0
  -- vim.g.neovide_scroll_animation_length = 0.3
  -- vim.g.neovide_refresh_rate = 60

  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_fullscreen = false
  -- Cursor

  -- vim.g.neovide_cursor_animation_length = 0.13
  vim.g.neovide_cursor_animation_length = 0.10

  -- vim.g.neovide_cursor_trail_size = 0.8
  vim.g.neovide_cursor_trail_size = 0.2

  -- vim.g.neovide_cursor_antialiasing = true

  vim.g.neovide_cursor_animate_command_line = false
end

return {}
