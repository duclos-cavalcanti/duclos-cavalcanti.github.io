#!/bin/bash

main() {
    pandoc --template=cover/template.tex cover/cover.md -o cover/cover.pdf
}

for p in wkhtmltopdf pandoc; do 
    if ! command -v ${p} &>/dev/null; then
        printf "${p} is not installed!\n"
        exit 1
    fi
done

main
