#!/bin/bash

source ./installation/simple_setup_install/prompt_installing_tool.sh
source ./installation/simple_setup_install/prompt_installing_shell.sh
source ./utils/tool_install_util.sh
source ./logs/err.sh

tools_install() {
    args=("$@")
    mkdir ./tmp
    for ((i=0; i<${#args[@]}-1; i++)); do
        if which ${args[$i]} > /dev/null; then
            prompt_already_installed "tool '${args[$i]}' is already installed"
        else
            prompt_installing_tool "installing '${args[$i]}'" &&
            tool_install ${args[$i]} ${!#}
        fi
    done
    rm -rf ./tmp
}

zshell_install() {
    
    while :; do
        zshell_install_question
        choice=$(get_user_choice)

        is_user_choice_correct $choice

        if [ "$?" -eq 0 ]; then
            start_install_on_choice $choice $1
            break # ou return 1 selon la logique souhaitée
        else
            prompt_err "incorrect choice, pls provide y or n"
            continue
        fi
        break
    done
}

start_install_on_choice() {
    [ "${1,,}" = "y" ] && tools_install "zsh" "$2" || return 0
}


