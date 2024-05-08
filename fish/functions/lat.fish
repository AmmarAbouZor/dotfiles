# Command for tree with two depth levels with eza falling back to tree
function lat --wraps=exa --description 'Show file tree with two depth levels'
    tre -L 2 $argv
end
