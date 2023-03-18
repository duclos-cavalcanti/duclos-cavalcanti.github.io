#!/bin/bash

ERR_MSG=""

log() {
    if [ $? -eq 0 ]; then 
        local check="[X]"
        local err=""
    else 
        local check="[ ]"
        local err=" => ${ERR_MSG}"
    fi
    [ -n "${1}" ] && printf "${check} %s${err}\n" "${1}"
}

dependencies() {
    if ! command -v pandoc &>/dev/null; then
        printf "pandoc is not installed!\n"
        exit 1
    fi
}

copy_data() {
    cp CNAME public/

    [ -d public/assets ] && rm -rf public/assets
    cp -r assets public/
}

build_page() {
    src="$1"
    dst="$2"
    style="$3"

    if ! [ -f ${src} ]; then 
        ERR_MSG="${src} file doesn't exist!" 
        return 1
    fi

    if ! [ -f ${style} ]; then 
        ERR_MSG="${style} file doesn't exist!" 
        return 1
    fi

    # first sed appends to all headers (h1-h6) a underline tag
    cat ${src} | \
    sed -E 's/^(#+\s+.*)$/\1 \n\n<hr \/>/' | \
    pandoc -s \
           -f markdown \
           -o ${dst} \
           -c ${style} \
           --include-before-body=templates/top.html \
           --include-after-body=templates/bottom.html \
           --template=templates/pandoc.html
}

main() {
    copy_data

    # build home page
    build_page pages/index.md public/index.html assets/css/style.css
    log "HOME BUILT"

    # build pages/posts
    for p in $(ls pages/ | sort -r); do
        if [ -d pages/${p} ]; then
            local dir=pages/${p}
            local file=pages/${p}/index.md
            local page=public/${p}/index.html

            [ -d ${dir} ] || mkdir -p www/${p}

            build_page ${file} ${page}
            [ $? -eq 0 ]; log "${p^^} BUILT"
        fi
    done
}

dependencies
main
