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
	@cp ./assets/pdfs/resume.pdf ~/Downloads/

cover:
	@./cover.sh
	@cp ./cover/cover.pdf ~/Downloads/

deploy:
	@./deploy.sh
	@${MAKE} restart

stop:
	@docker stop ${APACHE_ID}

serve: $(if ${IS_APACHE}, , pull)
	@docker run --rm \
			   --detach \
			   --name ${APACHE_NAME} \
			   -p 8080:80 \
			   -v ${PWD}/public:/usr/local/apache2/htdocs \
			   httpd:latest

restart: stop serve build

pull:
	@docker pull httpd

attach:
	@[ -n ${IS_APACHE_RUNNING} ] && docker exec -it ${APACHE_NAME} bash

