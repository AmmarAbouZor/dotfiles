function wezterm --wraps=wezterm --description 'alias wezterm=flatpak wezterm'
    /usr/bin/flatpak run org.wezfurlong.wezterm $argv
end
