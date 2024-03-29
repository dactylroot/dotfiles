# $HOME/.bashrc
# Personal Bash config used mostly in Ubuntu and Apple Terminal

# If not running interactively, exit script
case $- in
    *i*) ;;
      *) return;;
esac

# bash-completion Mac/Linux:
if hash brew 2>/dev/null; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
else
    [ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion
fi

set completion-ignore-case on

# Make sure files are NOT world readable
umask 077

export EDITOR=vim
export DISPLAY=:0.0

#################
# History Files #
#################
HISTCONTROL=ignoreboth
shopt -s histappend
export HISTFILE="~/.bash_history"
export HISTSIZE=1000
export HISTFILESIZE=1000

##################
# X Window Title #
##################
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'

#############
#  Prompts  #
#############
NORMAL="\[\033[00m\]"
BLACK="\[\033[0;30m\]"
GREY="\[\033[01;30m\]"
RED="\[\033[01;31m\]"
GREEN="\[\033[0;32m\]"
BROWN="\[\033[0;33m\]"
YELLOW="\[\033[1;33m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
LGREY="\[\033[0;37m\]"
WHITE="\[\033[1;37m\]"

#PS1="${NORMAL}\u@\h ${GREEN}\t ${RED}\$ ${NORMAL}"

# The default for PS2 is > which may be mistaken for a re-direct
#export PS2="\\"

###########
# Aliases #
###########
if [ -x /usr/bin/dircolors ]; then
    # https://geoff.greer.fm/lscolors/
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    # Color mode for Mac Terminal
    export CLICOLOR=1
    export LSCOLORS=exGxchDxFxcxcxcxcxcxcx
fi

alias ll='ls -alFh'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias r='R'
alias sl='screen -list'
alias scan='sudo arp-scan --interface=en0 --localnet'
alias dubu='DOCKER_DEFAULT_PLATFORM=linux/x86_64 docker run -it -v /Users/michael/Downloads/:/root/downloads:ro ubuntu'
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

##############
# Path Setup #
##############
# include in path if directory is found
path_update(){
    if [ -d "$1" ] && [ ! $(echo $PATH | grep $1) ] ; then
        PATH="$1:$PATH"
    fi
}

path_update "$HOME/.local/bin"
path_update "$HOME/.pyenv/bin"

unset -f path_update
