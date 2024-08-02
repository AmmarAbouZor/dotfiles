function g --wraps=git --description 'alias g=git'
    if test -n "$argv"
        # invoke git with the passend arguments 
        git $argv
    else
        # invoke git status if no arguments are provided
        git status
    end
end
