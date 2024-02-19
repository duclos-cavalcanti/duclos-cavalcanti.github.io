SHELL := /bin/bash
PWD := $(shell pwd)

ifeq (, $(shell which pandoc))
$(error Pandoc not found)
endif

.PHONY: exit \
		clean \
		run

all: run

exit:
	$(error Exiting Makefile)

clean:
	@rm -f *.aux 
	@rm -f *.bcf 
	@rm -f *.log 
	@rm -f *.xml 
	@rm -f *.xmpi 

run:
	@pandoc cover.md -o cover.pdf --pdf-engine=xelatex --template=template.tex
