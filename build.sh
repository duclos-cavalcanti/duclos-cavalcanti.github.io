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
    
    cat ${src} | \
    pandoc -s \
           -f markdown \
           -o ${dst} \
           -c ${style} \
           --include-before-body=templates/top.html \
           --include-after-body=templates/bottom.html \
           --template=templates/pandoc.html

    cp -r assets $(dirname ${dst})
}

main() {
    [ -d public/assets ] && rm -rf public/assets

    # build home page
    build_page pages/index.md public/index.html assets/css/style.css
    log "HOME BUILT"

    # build main pages
    for p in $(ls pages/ | sort -r); do
        if [ -d pages/${p} ]; then
            local dir=public/${p}
            [ -d ${dir} ] || mkdir -p ${dir}

            build_page pages/${p}/index.md public/${p}/index.html assets/css/style.css
            log "${p^^} BUILT"

            # build blog posts
            if [ ${p} == "blog" ]; then
                for b in $(ls pages/blog | sort -r); do
                    if [ -d pages/blog/${b} ]; then
                        dir=public/blog/${b}
                        [ -d ${dir} ] || mkdir -p ${dir}

                        build_page pages/blog/${b}/index.md public/blog/${b}/index.html assets/css/style.css
                        log "${p^^}/${b^^} BUILT"
                    fi
                done
            fi
        fi
    done

    cp CNAME public/
    cp -r assets public/
}

dependencies
main
