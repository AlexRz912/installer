#!/bin/bash
source ./utils/enable_standard_log_util.sh
source ./installation/install_tools.sh

enable_standard_logging $1
enabled=$?

tools_install nano vim curl code git tldr $enabled
zshell_install $enabled

[ $2 = "simple" ] && ssh-keygen -t rsa -b 4096
# man pages


