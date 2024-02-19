#!/bin/bash

check() {
    if [ -n "$(git status --porcelain)" ]; then
        printf "%s\n" "Staging Area not clean!"
        exit 1
    fi

    if [ -n "$(ls public)" ]; then 
        printf "%s\n" "Public folder empty! Build first!"
        exit 1
    fi

    return 0;
}

create_gh_pages() {
	git subtree split --prefix public -b gh-pages
	git checkout gh-pages

	if [ -d public ]; then
        {
            [ -d assets ] && rm -rf assets
            [ -d resume ] && rm -rf resume
            mv public/* ./
	        rm -rf public
        } 2> /dev/null
    else 
        printf "%s\n" "For some reason the public folder is not available from $(pwd)!"
    fi
}

deploy() {
	git add --all && git commit -m "Update"
	git push origin gh-pages --force
}

delete_gh_pages() {
	git checkout main
	git branch -D gh-pages
}

main() {
    # pre-check 
    check 

	cp CNAME public/

    create_gh_pages
    deploy
    delete_gh_pages
}

main 
