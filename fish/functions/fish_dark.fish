# Set dark (default) theme on the current shell
function fish_dark --wraps=fish_dark --description 'Set dark (default) theme locally'
    fish_config theme choose "Base16 Eighties"
end
