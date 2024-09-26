# Use delta with git diffs to show diffs in split view
# It offer the possibility to add arguments to diff too like `gd --staged`  
function gd --wraps=git-diff --description 'alias gd=git diff | delata -s'
    git diff $argv | delta -s
end
