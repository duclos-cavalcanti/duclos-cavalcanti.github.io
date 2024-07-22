SHELL  := /bin/bash
PWD    := $(shell pwd)
PUBLIC := ${PWD}/public


ifeq (, $(shell which docker))
$(error docker not found)
endif

ifeq (, $(shell which hugo))
$(error hugo not found)
endif

.PHONY: exit \
		clean \
		build \
		cover \
		resume \
		serve

all: build

exit:
	$(error Exiting Makefile)

build:
	@cp -v ./resume/resume.pdf ./website/content/data/pdfs/resume.pdf
	@cd website && hugo
	@rm -rf public
	@mv -v website/public ./
	@touch public/.gitkeep

serve:
	@cd website && hugo server

resume:
	@$(MAKE) -C resume

cover:
	@$(MAKE) -C cover

clean: 
	echo "CLEAN"

