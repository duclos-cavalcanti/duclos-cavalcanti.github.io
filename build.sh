#!/bin/bash

ERR_MSG=""

log() {
    local res=$?
    local check=
    local err=

    if [ ${res} -eq 0 ]; then 
        check="[T]"
        err=""
    else 
        check="[F]"
        err="=> ${ERR_MSG}"
    fi

    [ -n "${1}" ] && printf "${check} %s ${err}\n" "${1}"
}

build() {
    local file="${1}"

    if ! [ -f ${file} ]; then 
        ERR_MSG="${file} file doesn't exist!" 
        return 1
    fi

    local dir="$(dirname ${file})"
    local dst=${dir/pages/public}
    [ -d ${dst} ] || mkdir -p ${dst}

    local styles=(-c /assets/css/base.css)
    local c_style=assets/css/$(basename ${dir}).css
    [ -f ${c_style} ] && styles+=(-c /${c_style})

    pandoc -s \
           -f markdown \
           -o ${dst}/index.html \
           --include-before-body=templates/top.html \
           --include-after-body=templates/bottom.html \
           --template=templates/pandoc.html \
           ${styles[@]} \
           ${file}
}

step() {
    local dir="${1}"
    if ! [ -d ${dir} ]; then 
        printf "%s\n" "Non-existing directory ${dir}" 
        exit 1
    fi

    for d in $(ls ${dir} | sort -r); do 
        if [ -d ${dir}/${d} ]; then 
            step ${dir}/${d}
        else
            if [ ${d} == "index.md" ]; then 
                build ${dir}/index.md
                log "${dir^^} BUILT"
            fi
        fi
    done
}

main() {
    # cleaning and copying assets
    [ -d public/assets ] && rm -rf public/assets
    cp -r assets public/

    # build web
    step pages
}

if ! command -v pandoc &>/dev/null; then
    printf "pandoc is not installed!\n"
    exit 1
fi

main
