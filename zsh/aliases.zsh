#remove unwanted grml aliases
unalias acs
unalias acsh
unalias acp
unalias adg
unalias agi
unalias ati
unalias ag
unalias au
unalias up
unalias dbp
unalias ge

# custom aliases 
alias lat="ls -lathF --color=auto"
alias vim="nvim"
alias ag="ag --color --color-line-number '0;35' --color-match '46;30' --color-path '4;36'"
alias tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'
