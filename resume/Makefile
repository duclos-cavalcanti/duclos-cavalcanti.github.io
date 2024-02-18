SHELL := /bin/bash
PWD := $(shell pwd)

ifeq (, $(shell which docker))
$(error Docker not found)
endif

DOCKER := thomasweise/docker-texlive-full
NAME := latex-resume

.PHONY: exit \
		clean \
		build

all: run

exit:
	$(error Exiting Makefile)

clean:
	$(info clean)

pull:
	@docker pull ${DOCKER}

run: $(if $(shell docker images --format "{{.Repository}}" | grep ${DOCKER}), , pull)
	docker run --rm \
			   --name ${NAME} \
			   -v ${PWD}:/data \
			   -w /data \
			   ${DOCKER}:latest \
			   pdflatex resume.tex
