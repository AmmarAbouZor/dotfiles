# change directory with fzf
function cdf --wraps=fzfcd --description 'change directory with fzf, alias cdf=cd $(find * -type d | fzf)'
    # find * -type d will list the folders only
    cd $(find ~ * -type d | fzf)
end
