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
source ~/.dotfiles/bash_git

DIRECTORY_COLOR="\[\033[1;36m\]"
BRANCH_COLOR="\[\033[1;33m\]"
BLACK="\[\033[0;38m\]"

export PS1="$DIRECTORY_COLOR\W$BRANCH_COLOR\$(parse_git_branch) \$$BLACK "

export PATH=$PATH:~/.dotfiles/bin

# set editor for gem open
export EDITOR=vim

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Ruby aliases
alias b="bundle exec"

alias v="gvim"

bind -f ~/.dotfiles/history_search
