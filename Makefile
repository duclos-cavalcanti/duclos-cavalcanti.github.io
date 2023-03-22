SHELL := /bin/bash
PWD := $(shell pwd)

APACHE_NAME := apache-serve-blog
APACHE_ID := $(shell docker ps -a | grep ${APACHE_NAME} | awk '{print $$1}')

IS_APACHE := $(shell docker images | tail -n +2 | awk '{print $$1}' | grep -o httpd)
IS_APACHE_RUNNING := $(shell docker ps -a | grep ${APACHE_NAME})

.PHONY: clean build serve serve-pull serve-attach
all: build

clean:
	@rm -rf public
	@mkdir public
	@touch public/.gitkeep

build:
	@./build.sh

deploy:
	@git subtree split --prefix public -b gh-pages
	@git checkout gh-pages
	@mv public/* ./
	@rm -rf public
	@git add --all && git commit -m "Update"
	@git push origin gh-pages --force
	@git checkout main
	@git branch -D gh-pages

stop:
	@docker stop ${APACHE_ID}

serve-pull:
	@docker pull httpd

serve-attach:
	@[ -n ${IS_APACHE_RUNNING} ] && docker exec -it ${APACHE_NAME} bash

serve: $(if ${IS_APACHE}, , serve-pull )
	@docker run --rm \
			   --detach \
			   --name ${APACHE_NAME} \
			   -p 8080:80 \
			   -v ${PWD}/public:/usr/local/apache2/htdocs \
			   httpd:latest

