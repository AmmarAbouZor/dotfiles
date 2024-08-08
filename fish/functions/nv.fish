# This script opens neovide with the current arguments if provided, otherwise it'll 
# call c function (find with fzf for dirs) and launch neovide with it's resuls
function nv --wraps=neovide --description 'neovide then exit with nv'
    if test -n "$argv"
        neovide --fork $argv
        # Exit the current shell
        exit
    else
        # find dirs $HOME with depth of 7 ignoring dot_dirs and give them to fzf
        # Use `fd` instead of 'find' if availabe
        set -l path ""
        if type -q fd
            set path (fd --type d --max-depth 7 --exclude '.*' '' ~| fzf)
        else
            set path (find ~  -maxdepth 7 -type d ! -path '*/.*'| fzf)
        end

        # Open neovide only if we got a value from fzf
        if test -n "$path"
            cd "$path"
            neovide --fork
            # Exit the current shell
            exit
        end
    end
end
