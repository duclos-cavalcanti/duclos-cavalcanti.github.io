SHELL := /bin/bash
PWD := $(shell pwd)

IS_APACHE := $(shell docker images | tail -n +2 | awk '{print $$1}' | grep -o httpd)
IS_APACHE_RUNNING := $(shell docker ps -a | tail -n +2 | awk '{print $$7}' | grep -o httpd)

APACHE_NAME := apache-serve-blog

.PHONY: build serve clean
all: build

clean:
	rm -rf www
	mkdir www

build:
	@./BUILD

serve-pull:
	docker pull httpd

attach:
	@[ -n ${IS_APACHE_RUNNING} ] && docker exec -it ${APACHE_NAME} bash

serve: $(if ${IS_APACHE}, , serve-pull )
	@echo 'http://localhost:8080' | xclip -i -sel clip
	docker run --rm \
			   --name ${APACHE_NAME} \
			   -p 8080:80 \
			   -v ${PWD}/www:/usr/local/apache2/htdocs \
			   httpd:latest

