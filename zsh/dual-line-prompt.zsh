#█▓▒░dual line prompt
#PROMPT='${USER_LEVEL}┌[%F{white}%n@%M${USER_LEVEL}]─[%F{white}%~${USER_LEVEL}]$(prompt_git_info)
#${USER_LEVEL}└─ - %F{white}'
PROMPT='${USER_LEVEL}┌[]─[%F{white}%~${USER_LEVEL}]
${USER_LEVEL}└─ - %F{white}'

RPROMPT='$(prompt_git_info)'
