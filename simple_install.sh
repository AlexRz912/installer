#!/bin/bash
source ./utils/enable_standard_log_util.sh
source ./installation/install_tools.sh

enable_standard_logging $1

enabled=$?
tools_install nano vim code git tldr $enabled

# [ $2 = "simple" ] && ssh-keygen -t rsa -b 4096

zshell_install $enabled



