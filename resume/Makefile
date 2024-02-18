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
	@rm -f *.aux 
	@rm -f *.bcf 
	@rm -f *.log 
	@rm -f *.xml 
	@rm -f *.xmpi 


pull:
	@docker pull ${DOCKER}

run: $(if $(shell docker images --format "{{.Repository}}" | grep ${DOCKER}), , pull)
	docker run --rm \
			   --name ${NAME} \
			   -v ${PWD}:/data \
			   -w /data \
			   ${DOCKER}:latest \
			   pdflatex resume.tex
	$(MAKE) clean
