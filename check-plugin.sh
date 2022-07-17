#!/bin/bash

HAS_GIT=false
if command -v git &> /dev/null; then
    HAS_GIT=true
else
    err "Sorry, you must install git before run."
fi


err() {
    echo "${1}" >&2
}

check_directory_pull() {
    git -C "${1}" fetch -q
    if [[ "$(git -C "${1}" rev-parse HEAD)" == "$(git -C "${1}" rev-parse @{u})" ]]; then
        echo "false"
    else
        echo "true"
    fi
}

check_all_directory() {
    for dir in "$(pwd)"/*/; do
        local need_pull
        need_pull=$(check_directory_pull "${dir}")

        if [[ "${need_pull}" == "true" ]]; then
            echo "${dir}"
        fi
    done
}

check_all_directory
