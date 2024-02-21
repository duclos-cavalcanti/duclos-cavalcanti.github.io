SHELL := /bin/bash
PWD := $(shell pwd)

ifeq (, $(shell which docker))
$(error Docker not found)
endif

DOCKER := httpd
NAME := web-serve-blog

.PHONY: exit \
		clean \
		pull \
		stop \
		build \
		pages \
		cover \
		resume \
		deploy \
		serve \ 
		rebuild

all: build

exit:
	$(error Exiting Makefile)

clean:
	@rm -rf public
	@mkdir public
	@touch public/.gitkeep

pull:
	@docker pull ${DOCKER}

stop: $(if $(shell docker ps --filter "name=${NAME}" --format "{{.ID}}") , ,exit)
	@docker stop $(shell docker ps --filter "name=${NAME}" --format "{{.ID}}")

pages:
	@./build.sh 

resume:
	@$(MAKE) -C resume
	@cp ./resume/resume.pdf ./assets/pdfs/resume.pdf

cover:
	@$(MAKE) -C cover

build: resume pages

deploy:
	@./deploy.sh

serve: $(if $(shell docker images --format "{{.Repository}}" | grep ${DOCKER}), , pull)
	@docker run --rm \
			   --detach \
			   --name ${NAME} \
			   -p 8080:80 \
			   -v ${PWD}/public:/usr/local/apache2/htdocs \
			   ${DOCKER}:latest

rebuild: stop serve build
