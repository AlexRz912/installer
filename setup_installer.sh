#!/bin/bash
source ./logs/inf.sh
source ./logs/success.sh
source ./logs/warn.sh
source ./logs/err.sh
source ./logs/usage.sh

if [[ "$1" == "help" || ( "$1" != "simple" && "$1" != "custom" ) || ( "$2" != "silent" && "$2" != "verbose" ) ]]; then
    prompt_usage
    exit 1
fi

[ "$1" = "custom" ] && bash ./custom_install.sh $2 && exit 1
bash ./simple_install.sh $2 && exit 1


# Simple
    # tools a installer par défaut
        # nano
        # vim
        # vscode

    # Verbeux : Affichage des messages pour chaque étapes et conclusion -> inf; warn; error
    # Silent : Conclusion de l'installation pour chaque étapes -> inf; warn; error
        # -> exception ssh
        # -> voir si c'est possible d'automatiser le push sur gitlab en cli
# Custom
    # tools a installer par défaut
            # nano
            # vim
            # vscode
    # Affichage de l'étape du minimal setup
        # Verbeux : Affichage des messages pour chaque étapes et conclusion -> inf; warn; error
        # Silent : Conclusion de l'installation pour chaque étapes -> inf; warn; error
            # -> exception ssh
            # voir si c'est possible d'automatiser le push sur gitlab en cli

    # custom setup

        # Containerization 
            # Docker
            # Kubernetes
        # Webservers
            # NGINX

        # Compilers/Interpreters
            # java
            # python3
            # c++
            # nasm
            # php
            # 

        # Databases
            # MySQL  
            # Postgre
            # MongoDB
            # Si autre -> préciser une lien
