
function zle-line-init zle-keymap-select {
    VIM_PROMPT=""
    VCS_PROMPT=""
    if [[ $KEYMAP == "vicmd" ]]; then
        PROMPT_COLOR=$VIM_MODE_COLOR
        VIM_PROMPT="[NORMAL]"
    else
	    PROMPT_COLOR=$PROMPT_NORMAL
    fi

    zle reset-prompt
}

function print_vcs_info {

    VCS_INFO_ITEM=(${(s:|:)${vcs_info_msg_0_}})
    if [[ -n ${VCS_INFO_ITEM} ]]; then
        echo "[${VCS_INFO_ITEM[1]}:%F{white}${VCS_INFO_ITEM[2]}${PROMPT_COLOR}${VCS_INFO_ITEM[3]}]"
    fi
}

zle -N zle-line-init
zle -N zle-keymap-select

PROMPT='${PROMPT_COLOR}┌[%*]─[%F{white}%~${PROMPT_COLOR}]
${PROMPT_COLOR}└─: %F{white}'
RPROMPT='${PROMPT_COLOR}${PROMPT_COLOR} $(print_vcs_info)'
