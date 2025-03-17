#!/bin/bash

source ./logs/success.sh
source ./logs/err.sh

curl_install_list=(code)

tool_install() {
    [[ $2 -eq 0 || $1 == "git" ]] && verbose "$1" || silent "$1"
}

silent() {
    if [ "$1" = "code" ]; then
        install_vscode > "./tmp/install_$1"
    else 
        sudo apt-get install -y "$1" > "./tmp/install_$1"
        which $1 >/dev/null && prompt_success "$1 successfully installed" || prompt_err "$1 installation failed"
    fi
}

verbose() {
    if [ "$1" = "code" ]; then
        install_vscode
    else
        sudo apt-get install $1 
        which $1 >/dev/null && prompt_success "$1 successfully installed" || prompt_err "$1 installation failed"
    fi
}

install_vscode() {
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/keyrings/microsoft-archive-keyring.gpg
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt update && sudo apt-get install code

    prompt_success "visual studio code successfully installed"
}
