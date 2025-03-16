#!/bin/bash
source ./logs/usage.sh

if [[( "$1" != "simple" && "$1" != "custom" ) || ( "$2" != "silent" && "$2" != "verbose" ) ]]; then
    prompt_usage
    exit 1
fi

[ "$1" = "custom" ] && bash ./custom_install.sh $2 && exit 1
bash ./simple_install.sh $2 $1




