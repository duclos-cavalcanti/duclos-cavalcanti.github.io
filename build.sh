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

get_path() {
    local file="${1}"
    local dir="$(dirname ${file})"
    local dst=${dir/pages/public}

    [ -d ${dst} ] || mkdir -p ${dst}
    echo "${dst}/index.html"
}

get_styles() {
    local arr=()

    for c in $@; do 
        local file=assets/css/${c}.css
        if [ -f ${file} ]; then 
            arr+=(-c /${file})
        fi
    done

    echo "${arr[@]}"
}

build() {
    local src="${1}"
    local dst=$(get_path "${src}")
    local top="${2}"
    local bottom="${3}"
    shift 3; local styles="${@}"

    if ! [ -f ${src} ]; then 
        ERR_MSG="${src} file doesn't exist!" 
        return 1
    fi

    pandoc -s \
           -f markdown \
           -o ${dst} \
           --include-before-body=${top} \
           --include-after-body=${bottom} \
           --template=templates/pandoc.html \
           ${styles} \
           ${src}
}

pdf() {
    local src="${1}"
    local dst="${2}"
    local st="${2}"

    if ! [ -f ${src} ]; then 
        ERR_MSG="${src} file doesn't exist!" 
        return 1
    fi

    cat ${src} | \
    sed "s|/assets/css|$(pwd)/assets/css|" | \
    sed "s|(PDF)||" | \
    wkhtmltopdf --enable-local-file-access - ${dst} 2> /dev/null
}

step() {
    local dir="${1}"
    local name=
    if ! [ -d ${dir} ]; then 
        printf "%s\n" "Non-existing directory ${dir}" 
        exit 1
    fi

    for d in $(ls ${dir} | sort -r); do 
        if [ -d ${dir}/${d} ]; then 
            step ${dir}/${d}
        else
            if [ ${d} == "index.md" ]; then 
                name=$(basename ${dir})
                if [[ ${dir} == *"resume"* ]] || [[ ${dir} == *"isaac"* ]]; then
                    build ${dir}/index.md \
                          templates/empty.html \
                          templates/empty.html \
                          $(get_styles reset ${name})

                    pdf ${dir/pages/public}/index.html assets/pdfs/resume.pdf

                    build ${dir}/index.md \
                          templates/empty.html \
                          templates/bottom.html \
                          $(get_styles colors ${name} top bottom)
                else
                    build ${dir}/index.md \
                          templates/top.html \
                          templates/bottom.html \
                          $(get_styles colors base ${name} top bottom)
                fi
                # build ${dir}/index.md \
                #       templates/top.html \
                #       templates/bottom.html \
                #       $(get_styles colors base top bottom ${name})
                log "${dir^^} BUILT"
            fi
        fi
    done
}

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
