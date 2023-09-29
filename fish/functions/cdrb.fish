function cdrb --wraps=cdrb --description 'alias cdrb=cd $(rake last_day)'
    cd $(rake last_day)
end
