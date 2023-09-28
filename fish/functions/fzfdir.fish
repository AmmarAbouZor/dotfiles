# select directory with fzf
function fzfdir --wraps=fzfdir --description 'find directory with fzf, alias fzfdir=find * -type d | fzf'
    # find * -type d will list the folders only
    find ~ * -type d | fzf
end
