SHELL := /bin/bash
FILE := $(lastword $(MAKEFILE_LIST))

CV=~/Documents/projects/personal/curriculum-vitae/project/main.pdf

all: 

.PHONY: clean
clean:
	@echo "## Removing Outputted files ##"

.PHONY: update-cv
update-cv:
	@echo "## Updating CV ##"
	@if [ -f ${CV} ]; then\
	 	cp -vi ~/Documents/projects/personal/curriculum-vitae/project/main.pdf ./assets/pdf/CV.pdf;\
	fi

.PHONY: git-push
git-push:
	@echo "## Pushing to Git ##"
	@git add --all
	@git commit -m "Update"
	@git push origin main

.PHONY: deploy
deploy: git-push
	@echo "## Deploying Website ##"
	@./bin/deploy

.PHONY: serve
serve:
	@echo "## Viewing Website locally ##"
	@bundle exec jekyll serve
