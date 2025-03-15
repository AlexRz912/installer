#!/bin/bash

source ./installation/prompt_installing_tool.sh
source ./utils/tool_install_util.sh

tools_install() {
    args=("$@")
    for ((i=0; i<${#args[@]}-1; i++)); do

        prompt_installing_tool "installing '${args[$i]}'" &&
        tool_install ${args[$i]} ${!#}
    done
}