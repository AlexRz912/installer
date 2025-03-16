#!/bin/bash

source ./.zshrc
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
            break
        else
            prompt_err "incorrect choice, pls provide y or n"
            continue
        fi
        break
    done
}

start_install_on_choice() {
    if [ "${1,,}" = "y" ]; then 
    tools_install "zsh" "$2"
    install_oh_my_zsh 
    switch_default_shell zsh
    custom_shell_rc zshrc
    else 
        return 0
    fi
}

switch_default_shell() {
    chsh -s $(which $1)
}

custom_shell_rc() {
    cat ".$1" > "$HOME/.$1"
}

install_oh_my_zsh() {
    sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
}

