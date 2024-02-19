#!/bin/bash

check() {
    if [ -z "$(git status --porcelain)" ] && \
       [ -n "$(ls public)" ]; then 
        return 0;
    else 
        printf "%s\n" "Repo isn't ready for deployment!"
        exit 1
    fi
}

create_gh_pages() {
	git subtree split --prefix public -b gh-pages
	git checkout gh-pages

	if [ -d public ]; then
        {
            [ -d assets ] && rm -rf assets
            [ -d resume ] && rm -rf resume
            [ -d cover ] && rm -rf cover
            [ -f deploy.sh ] && rm -rf deploy.sh
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
