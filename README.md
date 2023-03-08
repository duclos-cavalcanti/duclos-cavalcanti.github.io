# duclos-cavalcanti.github.io

## Introduction
Source code to my personal website, currently served through `Github Pages` and reachable at [www.ducloscavalcanti.com](www.ducloscavalcanti.com). The purpose of this repository is not only to easily deploy a static website, but also serve as a minor working example of how one can start his/her own blog with no use of frameworks or anything more complex than what's avaiable by default on a unix-like machine.

Generally, if one wished to deploy a static website of any kind, the
steps are somewhat the same.

* Structure website either manually or through an established static site generator.
* Obtain a domain.
* Install/Deploy a Web Server (Nginx, Apache, etc).
* Upload to server or use a cloud platform service such as Netlify.
* Finally, optionally set up SSL certificates for HTTPS use.

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

## License
These files are released under the MIT license. See [LICENSE](LICENSE).

