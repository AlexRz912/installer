#!/bin/bash
source ./utils/enable_standard_log_util.sh
source ./installation/install_tools.sh
# source ./utils/script_utils.sh

enable_standard_logging $1
tools_install nano vim code git tldr $?


