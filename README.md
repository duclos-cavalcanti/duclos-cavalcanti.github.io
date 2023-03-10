# duclos-cavalcanti.github.io

## Introduction
Source code to my personal website, currently served through `Github Pages` and can be reached at [www.ducloscavalcanti.com](www.ducloscavalcanti.com).
The purpose of this repository is not only to easily deploy a static website, but also serve as a minor working example of how one can start a
blog with no use of frameworks or anything more complex than what's available by default on a unix-like machine.

Generally, to deploy a static website of any kind, the
steps can be generalized as such:

* Structure website:
  - manually *(HTML, CSS)*
  - static site generator.
* Obtain a domain.
* Install/Deploy a Web Server (Nginx, Apache, etc).
* Upload to server or use a cloud platform service such as Netlify.
* Optionally set up SSL certificates for HTTPS.

Github pages automates part of this process as it takes care of the webserver and cloud
portion of this workflow.

## Web Basics
- URL - Uniform Resource Locator
  * Through DNS, the URL can be converted into an IP address
- Client - Server communication through http
  * Client (Browser) requests data (homepage, links, images)
  * Server *'serves'* the client with data
- DOM - Document Object Model

## Instructions
#### 1. Build/Deploy
  ```sh
  make build
  ```

#### 2. Serve locally
  ```sh
  make serve
  ```

## Thanks
* [sebastian-tronto](https://sebastiano.tronto.net/blog/2022-08-14-website/)

## References
* [HTML & CSS Course](https://www.youtube.com/watch?v=G3e-cpL7ofc)
* [HTML Tutorial](https://www.youtube.com/watch?v=qz0aGYrrlhU)

## License
These files are released under the MIT license. See [LICENSE](LICENSE).

