#!/bin/bash

start() {
    for i in $@; do
        bash "./$i"
    done
}