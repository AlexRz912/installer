#!/bin/bash

source ./utils/disable_standard_log_util.sh
# source ./utils/script_utils.sh

enable_standard_logging $1

[ $? -eq 0 ] && enabled=0 || enabled=1



