# Use eza (exa) to for tree command if possible, falling back to tree
function tre --wraps=exa --description 'Show current file tree using eza'
    # Check if eza is installed
    if type -q eza
        eza -T $argv
    else
        # Otherwise fallback to tree
        tree $argv
    end
end
