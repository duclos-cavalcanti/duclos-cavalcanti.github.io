#!/bin/bash

main() {
    # cleaning assets
    [ -d public/assets ] && rm -rf public/assets

    # build web
    step pages

    # copying assets
    cp -r assets public/
}

for p in wkhtmltopdf pandoc; do 
    if ! command -v ${p} &>/dev/null; then
        printf "${p} is not installed!\n"
        exit 1
    fi
done

main
