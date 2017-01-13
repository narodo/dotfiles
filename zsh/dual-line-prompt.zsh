
function zle-line-init zle-keymap-select {
    VIM_PROMPT=""
    if [[ $KEYMAP == "vicmd" ]]; then
        PROMPT_COLOR=$VIM_MODE_COLOR
        VIM_PROMPT="[NORMAL]"
    else
	    PROMPT_COLOR=$PROMPT_NORMAL
    fi
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

PROMPT='${PROMPT_COLOR}┌[%*]─[%F{white}%~${PROMPT_COLOR}]
${PROMPT_COLOR}└─: %F{white}'

RPROMPT='${VIM_MODE_COLOR}$VIM_PROMPT$(prompt_git_info)$(prompt_hg_info)'
