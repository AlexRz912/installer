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
            prompt_already_installed "tools ${args[$i]} is already installed"
        else
            prompt_installing_tool "installing '${args[$i]}'" &&
            tool_install ${args[$i]} ${!#}
        fi
    done
    rm -rf ./tmp
}

handle_user_choice() {
    while :; do
        choice=$(get_user_choice)
        choice=$(choice_downcase)
        is_user_choice_correct $choice
        echo $choice
        if [ $? -eq 0 ]; then
            break # ou return 1 selon la logique souhaitée
        else
            prompt_err "incorrect choice"
            continue
        fi
        break
    done
}

zshell_install() {
    zshell_install_question
    choice=$(handle_user_choice)
    accept_zshell_install $choice
}


