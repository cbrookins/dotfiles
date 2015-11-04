# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
PS1_NOVCPROMPT='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '

export EDITOR="/usr/bin/nano"
export WINEDEBUG=-all
export XAUTHORITY="~/.Xauthority"

# SSH keychain
[ ! -n SUDO_USER ] && eval `keychain --eval --quiet identity`

alias dmesg-tail='sudo dmesg | tail -n 50'
alias dmesg-less='sudo dmesg | less'
alias emerge-keywords='sudo ACCEPT_KEYWORDS=~x86 emerge'
alias ls-head='ls -lt | head'
alias xcalib-dark='xcalib -alter -invert'
alias xrdb-defaults='xrdb -load ~/.Xresources'
alias sudo='sudo '

# If you use non-login shells you still need to
[ -f /etc/profile.d/bash-completion.sh ] && source /etc/profile.d/bash-completion.sh
