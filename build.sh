#!/bin/bash

LOG=()

log() {
    [ -n "${1}" ] && printf "%s\n" "${1}"
}

dependencies() {
    if ! command -v pandoc &>/dev/null; then
        printf "pandoc is not installed!\n"
        exit 1
    fi
}

build_page() {
    src="$1"
    dst="$2"
    style="$3"

    [ -f ${src} ]   || return 1
    [ -f ${style} ] || style=css/style.css

    pandoc -s -f markdown ${src} \
           -o ${dst} \
           -c ${style} \
           --include-in-header=templates/header.html \
           --template=templates/pandoc.html
}

copy_assets() {
    for d in $(ls assets); do 
        if [ -d ${d} ]; then 
            [ -d public/${d} ] && rm -rf public/$[d]
            cp -r assets/${d} public/
        fi
    done
}

main() {
    copy_assets

    # build home page
    build_page home/index.md public/index.html css/style.css
    [ $? -eq 0 ] && log "[X] HOME BUILT" || log "[ ] HOME BUILT"

    # build pages/posts
    for p in $(ls pages/ | sort -r); do
        if [ -d pages/${p} ]; then
            local dir=pages/${p}
            local file=pages/${p}/index.md
            local page=public/${p}/index.html

            [ -d ${dir} ] || mkdir -p www/${p}

            build_page ${file} ${page}
            [ $? -eq 0 ] && log "[X] ${p^^} BUILT" || log "[ ] ${p^^} BUILT"
        fi
    done
}

parse() {
    :
}

parse $@
dependencies
main
