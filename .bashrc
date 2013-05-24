# /etc/skel/.bashrc:
# $Header: /var/cvsroot/gentoo-src/rc-scripts/etc/skel/.bashrc,v 1.10 2004/09/29 04:13:33 agriffis Exp $
## 
# This file needs to have a .profile or .bash_profile in conjunction with it.

# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$HOME/bin/text_prep:/extra/stewarm10/bin:$PATH"
fi

# uncomment the following to activate bash-completion:
[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion

# Make new files world readable
umask 013

###############################################################################
#
# Specific module account settings:
#
###############################################################################
#source /opt/Modules/init/bash

#module load ics-default
#module load matlab
#module load eclipse/3.7.1
#module load python/2.7.2
#module load python/3.2.1
#module load texlive/2012
#module load tcl
#module load tk
#module load R
#module load maven/3.0

###############################################################################
#
# Variables
#
###############################################################################
# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
        # Shell is non-interactive.  Be done now
	return
fi

export EDITOR=gvim

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
PS1="${GREY}\u@\h ${GREEN}\t ${RED}\w \$ ${NORMAL}"
#comment this PS1 and use above if you want color
#PS1="\u@\h \t \w \n\$ "

# The default for PS2 is > which may be mistaken for a re-direct
export PS2="\\"

#General Settings
set noclobber
# Let me know when a background job has finished the moment it finishes.
set notify

# limit the core size to 1MB (2000 512-byte blocks)
ulimit -c 2000

THEOS=`uname`
THEREV=`uname -r`
RUID=`/usr/[ub][ci][bn]/whoami`

###############################################################################
#
# Specific alias account settings:
# These aliases are for all operating systems
#
###############################################################################

#navigation
alias up="cd .."

#graphical
alias xterm="xterm -rv -sb &"

# 
alias s="suspend"
alias 1="fg %1"
alias 2="fg %2"

#ph alias'
alias pha="ph alias=\!* return all"
alias phn="ph name=\!* return all"
alias phe="ph ext=\!* return all"
alias phi="ph id=\!*"

alias ll='ls -alFh'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias r='R'
alias ecs='emacs -bg black -fg white -geometry 99x50+560+122 &'
alias matlab='module load matlab; export MATLABPATH=$HOME/bin/:$HOME/bin/matlab/:/home/newman/matlab/; matlab' 
alias matcmd='module load matlab; export MATLABPATH=$HOME/bin/:$HOME/bin/matlab/:/home/newman/matlab/; matlab -nosplash -nodesktop' 
alias matlic='echo pinging matlab license server;/pkg/matlab/7.14_r2012a/etc/glnxa64/lmutil lmstat -c /pkg/matlab/7.14_r2012a/licenses/network.lic -A | grep "Users of MATLAB:"'
