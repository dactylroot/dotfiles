# /etc/skel/.bashrc:
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.

# uncomment the following to activate bash-completion:
[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion

# Make new files world readable
umask 013

# Add custom scripts to path
export PATH=~/scripts:$PATH

# Tab completion case-insensitive
set completion-ignore-case on

export EDITOR=gvim
export DISPLAY=:0.0

#add the printer name!
#export PRINTER=name
#export LPRINTER=name

# history files
# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups:ignorespace
# append to the history file, don't overwrite it
shopt -s histappend
export HISTFILE="~/.bash_history"
export HISTSIZE=1000
export HISTFILESIZE=10000

# Change the window title of X terminals
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'

#prompt
BLACK="\[\033[0;30m\]"
BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"
GREY="\[\033[01;30m\]"
CYAN="\[\033[0;36m\]"
RED="\[\033[01;31m\]"
PURPLE="\[\033[0;35m\]"
BROWN="\[\033[0;33m\]"
LGREY="\[\033[0;37m\]"
Yellow="\[\033[0;33m\]"
White="\[\033[0;37m\]"
NORMAL="\[\033[00m\]"

#PS1="${GREY}\u@\h ${GREEN}\t ${RED}\w \n\$ ${NORMAL}"
PS1="${LGREY}\u@\h ${GREEN}\t ${RED}\$ ${NORMAL}"
#comment this PS1 and use above if you want color
#PS1="\u@\h \t \w \n\$ "

# The default for PS2 is > which may be mistaken for a re-direct
export PS2="\\"

#General Settings
set noclobber
# Let me know when a background job has finished the moment it finishes.
set notify

THEOS=`uname`
THEREV=`uname -r`
RUID=`/usr/[ub][ci][bn]/whoami`

###############################################################################
#
# Specific alias account settings:
# These aliases are for all operating systems
#
###############################################################################
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alFh'
alias llt='ls -alFht'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias r='R'
alias ecs='emacs -bg black -fg white -geometry 99x50+560+122 &'
alias tl='tail -f -n500'

#######################
# pyenv configuration #
#######################
if hash pyenv 2>/dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

