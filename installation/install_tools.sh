#!/bin/bash

source ./installation/prompt_installing_tool.sh
source ./utils/tool_install_util.sh

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