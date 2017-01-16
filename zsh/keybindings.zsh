# set to vi mode
bindkey -v 

# vi timeout
KEYTIMEOUT=20

# exit mode with jj
bindkey -M viins 'jj' vi-cmd-mode

# set up for insert mode too
bindkey  '^p' history-incremental-pattern-search-backward
bindkey  '^n' history-incremental-pattern-search-forward
