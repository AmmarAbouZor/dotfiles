# select directory with fzf starting from the current path
function fzfdir --wraps=fzfdir --description 'select directory with fzf starting from the current path'
    # If an argument is provided then just execute z with it, Otherwise start fzf 
    if test -n "$argv"
        z $argv
    else
        # find dirs from current path ignoring dot_dirs and give them to fzf
        set -l path (find -type d ! -path '*/.*'| fzf)

        # Apply zioxide only if we got a value from fzf
        if test -n "$path"
            z $path
        end
    end
end
