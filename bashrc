#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias 204='ssh mercion@10.50.159.204'
alias 212='ssh mercion@10.47.39.212'
alias optiplex='ssh mercion@mwi-optiplex'
alias buildbox='ssh -p 2221 vagrant@10.47.39.45'
alias gmrun='screen -d -m gmrun'
alias vu='vi'
alias vo='vi'
PS1='[\u@\h \W]\$ '


VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
PATH=$PATH:/home/mercion/scripts
export WORKON_HOME=$HOME/.virtualenvs
source ~/scripts/virtualenvwrapper.sh


if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi
