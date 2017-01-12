# paths

# preferred editor for local and remote sessions
export EDITOR=vim
export VISUAL=vim

# setup less options
export LESS='-F -g -i -M -R -S -w -X -z-4'
# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi