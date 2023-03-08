SHELL := /bin/bash

IS_APACHE := $(shell docker images | tail -n +2 | awk '{print $1}' | grep -o ${httpd})

.PHONY: build serve clean
all: build

clean:
	rm -rf www
	mkdir www

build:
	@./BUILD

serve-pull:
	docker pull httpd

serve: $(if ${IS_APACHE}, , serve-pull )
	@docker run --rm \
			   --name apache-serve-blog \
			   -p 8080:80 \
			   -v $PWD/www:/usr/local/apache2/htdocs/ \
			   httpd:latest
	@echo 'http://localhost:8080' | xclip -i -sel clip

