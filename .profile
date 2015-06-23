# Color variables
source $HOME/bin/bash_colors.sh

# Custom PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$HOME/bin:$HOME/utils:$PATH
export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
export PATH=$HOME/.rvm/bin:$PATH

# Git customizations
source $HOME/bin/git-completion.sh
source $HOME/bin/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=auto

# Load RVM into a shell session as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Setup virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export VIRTUAL_ENV_DISABLE_PROMPT=1
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Better ls
export CLICOLOR=1
alias ls='ls -hl'

# Better history
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# Custom prompt
prompt() {
    # Git
    local G="$(__gitdir)"
    if [ -n "$G" ]; then
        local GIT="${RED}$(__git_ps1)${NORMAL}"
    fi
    # Python virtualenv
    if [ -n "$VIRTUAL_ENV" ]; then
        local VENV=" ${YELLOW}(`basename $VIRTUAL_ENV`)${NORMAL}"
    fi
    PS1="\n\u@\h:${BLUE}\w${NORMAL}${GIT}${VENV}\n\$ "
}
PROMPT_COMMAND=prompt
