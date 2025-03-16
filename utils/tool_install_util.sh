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
    sudo apt-get install -y wget gpg
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/packages.microsoft.gpg > /dev/null
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
    rm -f packages.microsoft.gpg

    prompt_success "visual studio code successfully installed"
}