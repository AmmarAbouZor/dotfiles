# Use eza (exa) to list the files if possible, falling back to ls
function la --wraps=exa --description 'List the content of directory including hiddne files using eza falling back to ls'
    # Check if eza is installed
    if type -q eza
        eza -laas type $argv
    else
        # Otherwise fallback to ls
        ls -lah $argv
    end
end
