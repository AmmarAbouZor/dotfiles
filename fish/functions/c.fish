# change directory with fzf
function c --wraps=fzfcd --description 'change directory with fzf, alias c=z $(find * -type d | fzf)'
    # If an argument is provided then just execute z with it, Otherwise start fzf 
    if test -n "$argv"
        z $argv
    else
        # find dirs $HOME with depth of 5 ignoring dot_dirs and give them to fzf
        # Use `fd` instead of 'find' if availabe
        set -l path ""
        if type -q fd
            set path (fd --type d --max-depth 5 --exclude '.*' '' ~| fzf)
        else
            set path (find ~  -maxdepth 5 -type d ! -path '*/.*'| fzf)
        end

        # Apply zioxide only if we got a value from fzf
        if test -n "$path"
            z $path
        end
    end
end
