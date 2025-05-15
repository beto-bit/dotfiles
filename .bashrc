#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

# Bash exclusive aliases
alias ls='ls --color=auto'

# Aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

