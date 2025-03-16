#!/bin/bash

source ./utils/question_util.sh

zshell_install_question() {
    prompt_question "Do you wish to install zsh? [Y/n]"
}

accept_zshell_install() {
    [ $1 = "y" ] && return 0 || return 1
}

get_user_choice() {
    read user_choice
}


choice_downcase() {
    echo $1 | tr '[:upper:]' '[:lower:]'
}

is_user_choice_correct() {
    [[ $1 =~ ^(y|n)$ ]] && return 0 || return 1
}
# which_shell_question() {
# 
# }
    
