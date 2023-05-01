function wbat
    tail -f $argv | bat --paging=never -l log
end
