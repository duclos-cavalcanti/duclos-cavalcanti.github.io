SHELL := /bin/sh

.PHONY: all build serve resume cover clean

all: build

# Generate public/ from the plain-text sources in site/.
build:
	@sh build.sh

# Build, then serve locally so absolute links (/about/, ...) resolve.
serve: build
	@echo "serving on http://localhost:8000  (Ctrl-C to stop)"
	@cd public && python3 -m http.server 8000

# Build the LaTeX resume -> resume/resume.pdf (needs a TeX install).
resume:
	@$(MAKE) -C resume

# Build the cover letter / statement.
cover:
	@$(MAKE) -C cover

clean:
	@rm -rf public
