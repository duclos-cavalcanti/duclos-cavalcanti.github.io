SHELL := /bin/bash
FILE := $(lastword $(MAKEFILE_LIST))

all: 

.PHONY: clean
clean:
	@echo "## Removing Outputted files ##"

.PHONY: update-cv
update-cv:
	@echo "## Updating CV ##"
	@cp -vi ~/Documents/projects/personal/curriculum-vitae/project/main.pdf ./assets/pdf/CV.pdf

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
