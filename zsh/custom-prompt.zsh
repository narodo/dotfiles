# update vi mode in prompt
psvmodeidx='1'
function zle-line-init zle-keymap-select {

    if [[ ${KEYMAP} = 'main' ]]; then
        psvar[$psvmodeidx]='i'
        
    else
        psvar[$psvmodeidx]='n'
    fi

    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# update prompt every 30 seconds to update time
TMOUT=30
TRAPALRM() {
    zle reset-prompt
}


# custom prompt tokens
grml_theme_add_token uleft '┌['
grml_theme_add_token lleft '└─'
grml_theme_add_token ] ']'
grml_theme_add_token [ '['
grml_theme_add_token cmd_prompt ': '
grml_theme_add_token vi-mode '%1v' '[' ']%f'
grml_theme_add_token my_time '%D{%H:%M}' '%F{blue}' '%f'

zstyle ':vcs_info:*'              formats       "%F{white}[%s:%F{blue}%b%F{white]"
zstyle ':vcs_info:*'              actionformats "$AF" "zsh: %r"

# custom prompt
zstyle ':prompt:grml:left:setup'  items uleft my_time ] [ path ] newline  lleft vi-mode cmd_prompt 
zstyle ':prompt:grml:right:setup' items vcs 
