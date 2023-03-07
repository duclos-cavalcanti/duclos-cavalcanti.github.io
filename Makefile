SHELL := /bin/bash
FILE := $(lastword $(MAKEFILE_LIST))

all: deploy

.PHONY: clean
clean:

.PHONY: git-push
git-push:
	@git add --all
	@git commit -m "Update"
	@git push origin main

.PHONY: deploy
deploy: git-push
	@./bin/deploy

.PHONY: serve
serve:
	@bundle exec jekyll serve
