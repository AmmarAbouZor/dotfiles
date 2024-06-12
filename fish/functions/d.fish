# select directory with fzf starting from the current path
function d --wraps=d --description 'select directory with fzf starting from the current path'
    # If an argument is provided then just execute z with it, Otherwise start fzf 
    if test -n "$argv"
        z $argv
    else
        # Use `fd` instead of 'find' if availabe
        set -l path ""
        if type -q fd
            set path (fd --type d --exclude '.*' ''| fzf)
        else
            set path (find -type d ! -path '*/.*'| fzf)
        end


        # Apply zioxide only if we got a value from fzf
        if test -n "$path"
            z $path
        end
    end
end
