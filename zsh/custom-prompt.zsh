# allow functions in the prompt
setopt PROMPT_SUBST

# autoload zsh functions
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)
 
# enable auto-execution of functions
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
 
# prepend git functions needed for prompt
preexec_functions+='preexec_update_repo_vars'
precmd_functions+='precmd_update_repo_vars'
chpwd_functions+='chpwd_update_repo_vars'

