#!/bin/bash

check() {
    if [ -z "$(git status --porcelain)" ]; then 
        return 0;
    else 
        printf "%s:\n\n%s\n" "Repo isn't ready for deployment!" "$(git status)"
        exit 1
    fi
}

create_gh_pages() {
	git subtree split --prefix public -b gh-pages
	git checkout gh-pages

	if [ -d public ]; then
        {
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

    echo "Building..."
    # build web
    {
        make clean 
        make build
    } 2> /dev/null
    sleep 1s

	cp CNAME public/

    echo "Git Kung fu..."
    create_gh_pages
    deploy
    delete_gh_pages
}

main 
