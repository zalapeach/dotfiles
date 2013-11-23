set match-hidden-files off
set page-completions off
set completion-query-items 350

# create big history file
export HISTSIZE=20000
export HISTFILESIZE=20000

# Now bash writes and re-reads the history file every time it prints a new prompt for you.
export PROMPT_COMMAND="history -a ; history -n;  ${PROMPT_COMMAND}"


shopt -s histappend
# don't put duplicate lines in the history and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# GIT ------------------------------------
# show current branch on shell
source ~/.gh-dotfiles/bash_git
source ~/.gh-dotfiles/task_completion.sh

BRANCH_COLOR="\[\033[42;30m\]"
ARROW_BRANCH="\[\033[49;32m\]⮀"
BLACK="\[\033[0;38m\]"
USER_INFO_ARROW="\[\033[47;30m\]⮀"
DIRECTORY_COLOR="\[\033[47;30m\]"
DIRECTORY_ARROW="\[\033[42;37m\]⮀"
PROMPT_ARROW="\[\033[49;30m\]⮀"
PROMPT_COLOR="\[\033[49;33m\]"

export PS1="$PROMPT_COLOR\u ⮁ \h $USER_INFO_ARROW$DIRECTORY_COLOR \W $DIRECTORY_ARROW$BRANCH_COLOR ⭠ \$(parse_git_branch) $ARROW_BRANCH\n$PROMPT_COLOR\$$BLACK "

bind "\e[A":history-search-backward
bind "\e[B":history-search-forward

alias n="nautilus . &"

export PATH=$PATH:~/.gh-dotfiles/bin

# set editor for gem open
export EDITOR=vim

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Ruby aliases
alias b="bundle exec"
