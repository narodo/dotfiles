# set to vi mode
setopt vi
# vi timeout
KEYTIMEOUT=20

# exit mode with jj
bindkey -M viins 'jj' vi-cmd-mode


# ---- history search ----
# set up for insert mode too
bindkey  '^p' history-incremental-pattern-search-backward
bindkey  '^n' history-incremental-pattern-search-forward

# ---- substring search  ---
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# also search in vimcmd mode with k/
 bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

#---- menu select ----
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect ' ' accept-and-infer-next-history
# "remove" jj to exit viins mode when in menu
bindkey -M menuselect 'jj' vi-down-line-or-history
