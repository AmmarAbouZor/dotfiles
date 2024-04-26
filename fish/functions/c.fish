# change directory with fzf
function c --wraps=fzfcd --description 'change directory with fzf, alias c=z $(find * -type d | fzf)'
    # If an argument is provided then just execute z with it, Otherwise start fzf 
    if test -n "$argv"
        z $argv
    else
        # find * -type d will list the folders only
        z $(find ~ * -type d | fzf)
    end
end
