#!/bin/bash

start() {
    for i in $@; do
        bash "./$i"
    done
}

my_function() {
    echo "import fonctionnel"
}