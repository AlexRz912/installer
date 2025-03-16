#!/bin/bash

source ./logs/success.sh
source ./logs/err.sh


tool_install() {
    [ $2 -eq 0 || $1 = "git" ] && verbose $1 || silent $1
}

silent() {
    [ "$1" = "code" ] && curl -O "" > "./tmp/install_$1" || apt-get install -y "$1" > "./tmp/install_$1"
    which $1 >/dev/null && prompt_success "$1 successfully installed" || prompt_err "$1 installation failed"    
}

verbose() {
    [ $1 = 'code' ] && curl -O "" || apt-get install $1 
    which $1 >/dev/null && prompt_success "$1 successfully installed" || prompt_err "$1 installation failed"
}