# Check if wezterm or neomvim light theme is on and change fish accordingly  
if set -q WEZ_LIGHT_THEME
    fish_light
else if test "$NVIM_THEME" = light
    fish_light
end
