# change directory with fzf
function c --wraps=fzfcd --description 'change directory with fzf, alias c=z $(find * -type d | fzf)'
    # If an argument is provided then just execute z with it, Otherwise start fzf 
    if test -n "$argv"
        z $argv
    else
        # find dirs $HOME with depth of 4 ignoring dot_dirs and give them to fzf
        z (find ~  -maxdepth 4 -type d ! -path '*/.*'| fzf)
    end
end
