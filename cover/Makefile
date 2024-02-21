SHELL := /bin/bash
PWD := $(shell pwd)

ifeq (, $(shell which pandoc))
$(error Pandoc not found)
endif

.PHONY: exit \
		clean \
		cover

all: cover

exit:
	$(error Exiting Makefile)

clean:
	@$(info clean)

cover: .cover

.cover: cover.md
	@pandoc cover.md -o cover.pdf --pdf-engine=xelatex --template=template.tex
	@touch .cover
	@cp cover.pdf ~/Downloads
