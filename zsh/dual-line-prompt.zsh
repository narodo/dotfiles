
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPROMPT="${VIM_MODE}${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(prompt_git_info)"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

PROMPT='${USER_LEVEL}┌[%*]─[%F{white}%~${USER_LEVEL}]
${USER_LEVEL}└─: %F{white}'


