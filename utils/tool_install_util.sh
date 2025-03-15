#!/bin/bash

source ./installation/prompt_installing_tool.sh
source ./logs/success.sh
source ./logs/err.sh


tool_install() {
    [ $2 -eq 0 ] && verbose $1 || silent $1
}

silent() {
    [ "$1" = "code" ] && curl -O "" > /dev/null || apt-get install -y "$1" > /dev/null
    which $1 >/dev/null && prompt_success "$1 successfully installed" || prompt_err "$1 installation failed"    
}

verbose() {
    [ $1 = 'code' ] && curl -O "" || apt-get install $1 
    which $1 >/dev/null && prompt_success "$1 successfully installed" || prompt_err "$1 installation failed"
}