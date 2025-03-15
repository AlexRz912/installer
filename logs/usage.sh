#!/bin/bash

prompt_usage() {
    echo "Usage:
  ./simple_install.sh help
  ./simple_install.sh <install_mode> <prompt_mode>

Available Commands:
  help        Prints this very same usage prompt

  <install_mode>:
  simple      Install minimal development environment
  custom      Install with custom softwares and tools

  <prompt_mode>:
  silent      Only prints conclusion for installation status
  verbose     Prints every step from standard install logging
  "
}

