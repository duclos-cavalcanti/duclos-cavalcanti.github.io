SHELL := /bin/sh

.PHONY: all build serve resume cover clean

all: build

build:
	@sh build.sh

serve: build
	@echo "serving on http://localhost:8000  (Ctrl-C to stop)"
	@cd public && python3 -m http.server 8000

resume:
	@$(MAKE) -C resume

clean:
	@rm -rf public
