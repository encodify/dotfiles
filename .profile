# Color variables
source $HOME/bin/bash_colors.sh

# Custom PATH
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
export PATH=$HOME/.rvm/bin:$PATH
export PATH=/Library/Frameworks/Python.framework/Versions/3.4/bin:$PATH

# Load RVM into a shell session as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Setup virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUAL_ENV_DISABLE_PROMPT=1
source /usr/local/bin/virtualenvwrapper.sh

# Better ls
export CLICOLOR=1
alias ls='ls -hl'

# Better history
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# Custom prompt
prompt() {
    if [ -n "$VIRTUAL_ENV" ]; then
        local VENV="${YELLOW}(`basename $VIRTUAL_ENV`)${NORMAL}"
    fi
    PS1="\n\u@\h:${BLUE}\w${NORMAL}\n${VENV}\$ "
}
PROMPT_COMMAND=prompt
