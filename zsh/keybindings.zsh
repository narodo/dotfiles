# set to vi mode
bindkey -v 

# vi timeout
KEYTIMEOUT=20

# exit mode with jj
bindkey -M viins 'jj' vi-cmd-mode

# Incremental 
bindkey '^R' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-pattern-search-backward
#
# set up for insert mode too
bindkey  '^p' history-incremental-pattern-search-backward
bindkey  '^n' history-incremental-pattern-search-forward
bindkey -M viins '^p' history-incremental-pattern-search-backward
bindkey -M viins '^n' history-incremental-pattern-search-forward
