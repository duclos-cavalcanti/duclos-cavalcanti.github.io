#!/bin/bash

dependencies() {
    programs=(
        lowdown
        yq
    )
    for p in ${programs[@]}; do
        if ! command -v ${p} &>/dev/null; then
            printf "${p} is not installed\n"
            exit 1
        fi
    done
}

file_extension() {
    printf "$(printf "${1}\n" | sed 's/.*\.//')\n"
}

build_page() {
    local page="$1"
    local src=pages/${page}/index.md
    local webpage=www/${name}/index.html

    [[ ! -e ${src} ]] && return 1

    # create webpage based on header, footer and md page
    cat templates/header.html > ${webpage}
    lowdown ${src} >> ${webpage}
    cat templates/footer.html >> ${webpage}

    # rename webpage
    local name=$(grep '^\# ' < ${src} | head -n 1 | sed 's/^\# //')
    sed "s/TITLE/${name}/" < ${webpage} > ${webpage}

    return 0
}

build_pages() {
    for elem in $(ls pages/ | sort -r); do
        if [ -d pages/${elem} ]; then
            [ -d www/${elem} ] || mkdir -p www/${elem}
            build_page ${elem}
            [ $? -eq 1 ] && printf 'No page in pages/${elem}\n' && continue

            cp -r pages/${elem}/!(index.md) www/${elem}/
        fi
    done
}

build_home() {

}

main() {
    build_home
    build_pages
}

main $@
