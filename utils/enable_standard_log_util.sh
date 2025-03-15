#!/bin/bash

enable_standard_logging() {
    [ "$1" = "verbose" ] && return 0 || return 1
}