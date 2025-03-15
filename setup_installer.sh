#!/bin/bash


[ "$#" -eq 0 ] && exit 1

[ "$1" = "custom" ] && bash ./custom_install.sh && exit 1
bash ./simple_install.sh && exit 1


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
