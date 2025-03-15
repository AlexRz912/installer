#!/bin/bash

source ./installation/prompt_installing_tool.sh
source ./logs/success.sh
source ./logs/err.sh


tool_install() {
    [ $2 -eq 1 ] && echo "verbose install for $1" || echo "verbose install for $2"
}

silent() {
    [ "$1" = "code" ] && curl -Oq "" || sudo apt install -y "$1"
    which $1 && prompt_success "$1 successfully installed" || prompt_err "$1 installation failed"
}

verbose() {
    [ $1 = 'code' ] && curl -O "" || apt install $1 
    which $1 && prompt_success "$1 successfully installed" || prompt_err "$1 installation failed"
}